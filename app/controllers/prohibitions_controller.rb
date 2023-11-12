class ProhibitionsController < ApplicationController
  def index
    # @users = User.all
    @users = User.search(params[:search])
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

  #Citation: search engine built based on https://testsuite.io/build-custom-search-in-ruby-on-rails
  def search
    term = params[:search]
    @results = User.where("lower(username) LIKE ?", "%#{term.downcase}%")
  end

  private
  def user_params
    params.require(:user).permit(:username, :search)
  end

end
