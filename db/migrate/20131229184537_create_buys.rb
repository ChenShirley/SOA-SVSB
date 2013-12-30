class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.integer :quantity
      t.string :place
			t.integer :user_id
			t.integer :product_id

      t.timestamps
    end
  end
end
