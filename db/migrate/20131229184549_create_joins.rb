class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :quantity
      t.string :deadline
			t.integer :user_id
			t.integer :product_id

      t.timestamps
    end
  end
end
