class AddLatToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :lng, :float
    add_column :restaurants, :lat, :float
  end
end
