class AddDefaultValueToRatingAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :restaurants, :rating, :integer, default: 0
  end
end
