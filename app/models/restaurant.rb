class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}

    def self.search(search)
        if search
            self.where("lower(name) LIKE ?", "%#{search.downcase}%")
        else
            @restaurants = Restaurant.all
        end
    end
end
