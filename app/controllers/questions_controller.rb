class QuestionsController < ApplicationController
    before_action :authorize_user!, only:[:edit,:update,:destroy]
    before_action :authenticate_user!, except:[:index, :show]
    # see more about controller life cycle hooks/callbacks here https://api.rubyonrails.org/classes/AbstractController/Callbacks/ClassMethods.html
    before_action :find_question, only: [:show, :edit, :update, :destroy]

    # If you want to pass variables to views, you must define them as
    # instance variables. That is prefix `@` in front of their name. Local
    # variables are inaccessible inside views.

    #returns all the questions from the database
    def index
       @questions = Question.all.order(created_at: :desc) #Model.all is a method built into active record used to return all records of that model 
    end

    def new
        #because Rails form helper methods need an instance of a model to work, we create a new instance
        @question = Question.new
    end

    def create
        @question = Question.new question_params
        @question.user=current_user

        if @question.save
            # flash is a hash that is accessible within controllers. It's also available within the views
            flash[:notice] = "Question created successfully"
            redirect_to questions_path
        else
            render :new
        end
    end

    def show
        #In the Model question.rb we created a custom method to set our view count to zero 
        #when the instance of a question is created. Now we can add to our view count every time
        #a user views the specific question on the show page as follows:
        @question.update(view_count: @question.view_count + 1)
        # Alternate:
        # @question.view_count += 1
        # @question.save
        @answer=Answer.new
        @answers=@question.answers.order(created_at: :desc)
        @like = @question.likes.find_by(user: current_user)
    end

    def edit
    end

    def update
        if @question.update question_params
            redirect_to question_path(@question)
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        redirect_to questions_path
    end

    def liked
        @questions = current_user.liked_questions.order(created_at: :desc)
    end

    private

    def question_params
        # params.require(:question): We must have a question object on the params of the request
        # .permit(:title, :body): For security reasons we only permit the title and body key/value pairs of the question
        params.require(:question).permit(:title, :body, :tag_names)
    end

    def find_question
        @question = Question.find params[:id]
    end
    def authorize_user!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud,Question)
    end

end
