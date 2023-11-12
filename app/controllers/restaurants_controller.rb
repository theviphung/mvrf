class RestaurantsController < ApplicationController
    def search
        @restaurants = Restaurant.search(params[:search], params[:gluten_req], params[:vegan_req],
        params[:vegetarian_req], params[:nut_allergy_req], params[:fish_allergy_req],
        params[:egg_allergy_req], params[:soy_allergy_req], params[:dairy_allergy_req],
        params[:kosher_req], params[:halal_req])
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
            :halal, :search, :gluten_req, :vegan_req, :vegetarian_req,
            :nut_allergy_req, :fish_allergy_req, :egg_allergy_req,
            :soy_allergy_req, :dairy_allergy_req, :kosher_req,
            :halal_req)
        end
end
