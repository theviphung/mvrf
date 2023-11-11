class RestaurantsController < ApplicationController
    def search
        @restaurants = Restaurant.search(params[:search])
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to @restaurant
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def restaurant_params
            params.require(:restaurant).permit(:name, :owner, :address, :hours, :rating, :ratingsnum, :description, :cuisine, :search)
        end
end
