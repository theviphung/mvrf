class DashboardsController < ApplicationController
  def index
  end

  #Get all general user's username (customer)
  def user_status
    @users = User.all
  end
end
