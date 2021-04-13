# rails g controller contacts
class ContactsController < ApplicationController
    def new
    end
    def create
            # params is an hash that contains information from the form that was submitted
    # we can create instance variables. These variables are available inside of views

        @name=params[:name]
        @email=params[:email]
        @message=params[:message]
        # When we define instance variable in aciotns such as @name we can access this in an associated views
    end
end
