class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.string :hours
      t.float :rating
      t.integer :ratingsnum
      t.text :description
      t.string :cuisine

      t.timestamps
    end
  end
end
