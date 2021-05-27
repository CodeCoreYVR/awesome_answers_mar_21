class UsersController < ApplicationController
    def show
        @user=User.find params[:id]
    end

    def new
        @user=User.new
    end
    def create
        @user=User.new user_params
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_path, notice: "Logged in!"
        else
            render :new
        end

    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address) ## Stron Parameters
        # It provides an interface for protecting attributes from end-use assignment. This makes action controller parameters forbidden to be used in Active Model mass assignement until they have been explictly enumerated/declared here. 

    end
end
