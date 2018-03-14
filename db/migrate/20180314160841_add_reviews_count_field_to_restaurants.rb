class AddReviewsCountFieldToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :review_count, :integer
  end
end
