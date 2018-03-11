class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id
      t.string :reviewer_name
      t.integer :rating
      t.text :review_comment
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
