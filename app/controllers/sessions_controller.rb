class SessionsController < ApplicationController
    def new

    end
    def create
        @user= User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
            # This authenticate method is comming from has_secure_password
            #  this will encrypt this password in the same was as the password at the time of sign up was encrypted and then it will compare the string and one string is matched it will return true else false
            session[:user_id]=@user.id
            # The 'session' is an object / hash useable in controller that cookies to store encrypted data. To Sign in a user, we store their user_id in the session for later user
            redirect_to root_path, notice: 'Logged in'
        else
            flash[:alert] = 'Wrong email or password'
            render :new
        end
    end
    def destroy
        
    end

end
