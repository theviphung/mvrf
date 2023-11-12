class RestaurantsController < ApplicationController
    def search
        @restaurants = Restaurant.search(params[:search], params[:gluten_req])
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

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])

        if @restaurant.update(restaurant_params)
            redirect_to @restaurant
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy

        redirect_to search_path, status: :see_other
    end

    private
        def restaurant_params
            params.require(:restaurant).permit(:name, :owner, :address, :hours, :rating, :ratingsnum, :description, :cuisine,
            :image, :tags, :gluten_intolerance, :vegan, :vegetarian, :nut_allergy,
            :fish_allergy, :egg_allergy, :soy_allergy, :dairy_allergy, :kosher,
            :halal, :search, :gluten_req)
        end
end
