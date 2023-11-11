class AddTagsToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :tags, :string
  end
end
