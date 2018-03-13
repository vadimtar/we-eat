class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating
      t.boolean :is_tenbis
      t.string :address
      t.integer :maximum_delivery_time
      t.belongs_to :cuisine, foreign_key: true

      t.timestamps
    end
  end
end
