# frozen_string_literal: true
# Step 2: Authorization - this file was genereated using following command
# rails g cancan:ability
# REQUIREMENT
# gem cancancan needs a current_user available in application controller, which we already have

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    #  can(<arg1:Action>,<arg2:ModelName>)
    # CRUD:
    # :create(:new)
    # :read(:show, :index) is an alias(nickname) to :index and :show
    # :update(:edit)
    # :destroy

    alias_action(:create,:read,:update,:delete, to: :crud )
    
    can(:crud,Question) do |question|
      user==question.user
    end

    can(:crud,Answer) do |answer|
      user == answer.user
    end
    # 👇🏻 current_user is the one who is that owner of the job_post
    can(:crud,JobPost) do |job_post|
      user == job_post.user
    end

    if user.is_admin?
      can :manage, :all # manage means is_admin can do every thing on ALL the models 
    end

    can(:like, Question) do |question|
      user.persisted? && question.user != user
    end

    can(:destroy, Like) do |like|
      like.user == user
    end

  end
end
