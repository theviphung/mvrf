class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}

    def self.search(search, gluten_req)
        if search
            self.where("lower(name) LIKE ?", "%#{search.downcase}%").or(self.where("lower(cuisine) LIKE ?", "%#{search.downcase}%")).or(self.where("lower(address) LIKE ?", "%#{search.downcase}%"))
        else
            @restaurants = Restaurant.all
        end
    end
end
