class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :description, presence: true, length: {minimum: 10}

    def self.search(search, gluten_req, vegan_req, vegetarian_req,
        nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
        dairy_allergy_req, kosher_req, halal_req)
        if search
            self.where("lower(name) LIKE ? AND gluten_intolerance >= ? AND vegan >= ? AND vegetarian >= ? AND nut_allergy >= ? AND fish_allergy >= ? AND egg_allergy >= ? AND soy_allergy >= ? AND dairy_allergy >= ? AND kosher >= ? AND halal >= ?",
            "%#{search.downcase}%", gluten_req, vegan_req, vegetarian_req, nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
            dairy_allergy_req, kosher_req, halal_req).or(self.where("lower(cuisine) LIKE ? AND gluten_intolerance >= ? AND vegan >= ? AND vegetarian >= ? AND nut_allergy >= ? AND fish_allergy >= ? AND egg_allergy >= ? AND soy_allergy >= ? AND dairy_allergy >= ? AND kosher >= ? AND halal >= ?",
            "%#{search.downcase}%", gluten_req, vegan_req, vegetarian_req, nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
            dairy_allergy_req, kosher_req, halal_req)).or(self.where("lower(address) LIKE ? AND gluten_intolerance >= ? AND vegan >= ? AND vegetarian >= ? AND nut_allergy >= ? AND fish_allergy >= ? AND egg_allergy >= ? AND soy_allergy >= ? AND dairy_allergy >= ? AND kosher >= ? AND halal >= ?",
            "%#{search.downcase}%", gluten_req, vegan_req, vegetarian_req, nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
            dairy_allergy_req, kosher_req, halal_req)).or(self.where("lower(description) LIKE ? AND gluten_intolerance >= ? AND vegan >= ? AND vegetarian >= ? AND nut_allergy >= ? AND fish_allergy >= ? AND egg_allergy >= ? AND soy_allergy >= ? AND dairy_allergy >= ? AND kosher >= ? AND halal >= ?",
            "%#{search.downcase}%", gluten_req, vegan_req, vegetarian_req, nut_allergy_req, fish_allergy_req, egg_allergy_req, soy_allergy_req,
            dairy_allergy_req, kosher_req, halal_req))
        else
            @restaurants = Restaurant.all
        end
    end


    #Check if Restaurants have which dietary preference
    def gluten_intolerance?
        gluten_intolerance
    end

    def vegan?
        vegan
    end

    def vegetarian?
        vegetarian
    end

    def nut_allergy?
        nut_allergy
    end

    def fish_allergy?
        fish_allergy
    end

    def egg_allergy?
        egg_allergy
    end

    def soy_allergy?
        soy_allergy
    end

    def dairy_allergy?
        dairy_allergy
    end

    def kosher?
        kosher
    end

    def halal?
        halal
    end
end
