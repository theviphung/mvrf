class DashboardsController < ApplicationController
  def index
  end

  def restaurant_info
    @restaurants = Restaurant.all
  end

end
