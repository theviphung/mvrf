class AddDietaryRestrictionsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gluten_intolerance, :boolean
    add_column :users, :vegan, :boolean
    add_column :users, :vegetarian, :boolean
    add_column :users, :nut_allergy, :boolean
    add_column :users, :fish_allergy, :boolean
    add_column :users, :egg_allergy, :boolean
    add_column :users, :soy_allergy, :boolean
    add_column :users, :dairy_allergy, :boolean
    add_column :users, :kosher, :boolean
    add_column :users, :halal, :boolean
  end
end
