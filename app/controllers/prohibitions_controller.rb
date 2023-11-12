class ProhibitionsController < ApplicationController
  def index
    @users = User.all
  end

  def ban_user
    @user = User.find(params[:id])
    @user.update_attribute(:banned, true)
    flash[:notice] = "User #{@user.username} has been banned"
    redirect_to user_status_path
  end

  def unban_user
    @user = User.find(params[:id])
    @user.update_attribute(:banned, false)
    flash[:notice] = "User #{@user.username} has been unbanned"
    redirect_to user_status_path
  end

end
