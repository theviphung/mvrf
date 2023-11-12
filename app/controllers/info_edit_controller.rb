class InfoEditController < ApplicationController
  def show
    @restaurants = Restaurant.all
  end

end
