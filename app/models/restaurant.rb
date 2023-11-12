class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}

    def self.search(search, gluten_req, vegan_req, vegetarian_req,
        nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
        dairy_allergy_req, kosher_req, halal_req)
        if search
            self.where("lower(name) LIKE ?", "%#{search.downcase}%").or(self.where("lower(cuisine) LIKE ?", "%#{search.downcase}%")).or(self.where("lower(address) LIKE ?", "%#{search.downcase}%"))
        else
            @restaurants = Restaurant.all
        end
    end
end
