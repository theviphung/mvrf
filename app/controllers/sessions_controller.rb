class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])

        if !! @user&& User.find_by(password: params[:password])
            sessions[:user_id] = @user.id
            redirect_to user_path


        else
            message = "Login unsuccessful. Please check credentials."
            redirect_to login_path, notice: message
        end
    end


end