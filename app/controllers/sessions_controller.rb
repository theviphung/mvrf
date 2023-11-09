class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])

        if !! @user && User.find_by(password: params[:password])
            session[:user_id] = @user.id
            redirect_to session_success_path(@user)


        else
            redirect_to session_error_path
        end
    end

    def destroy
        session.clear
        redirect_to logout_path
    end


end