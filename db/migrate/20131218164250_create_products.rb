class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productname
      t.string :category
      t.text :description
      t.integer :quantity
      t.integer :maxprice
      t.string :location
      t.string :deadline
			t.integer :user_id

      t.timestamps
    end
  end
end
