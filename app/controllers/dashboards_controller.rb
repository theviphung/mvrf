class DashboardsController < ApplicationController
  def index
  end

  #Get all general user's username (customer)
  def user_status
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

  def restaurant_info
    @restaurants = Restaurant.all
  end

end
