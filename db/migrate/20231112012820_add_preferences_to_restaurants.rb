class AddPreferencesToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :gluten_intolerance, :boolean
    add_column :restaurants, :vegan, :boolean
    add_column :restaurants, :vegetarian, :boolean
    add_column :restaurants, :nut_allergy, :boolean
    add_column :restaurants, :fish_allergy, :boolean
    add_column :restaurants, :egg_allergy, :boolean
    add_column :restaurants, :soy_allergy, :boolean
    add_column :restaurants, :dairy_allergy, :boolean
    add_column :restaurants, :kosher, :boolean
    add_column :restaurants, :halal, :boolean
  end
end
