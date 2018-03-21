class AddReviewsCountFieldToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :reviews_count, :integer
  end
end
