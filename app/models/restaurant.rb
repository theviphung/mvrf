class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}

    def self.search(search)
        if search
            restaurant_return = Restaurant.find_by(name: search)
            if restaurant_return
                self.where(id: restaurant_return)
            else
                @restaurants = Restaurant.all
            end
        else
            @restaurants = Restaurant.all
        end
    end
end
