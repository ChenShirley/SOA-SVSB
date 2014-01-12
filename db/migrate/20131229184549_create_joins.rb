class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :quantity
			t.integer :user_id
			t.integer :product_id
			t.integer :buy_id
			t.boolean :productrequest

      t.timestamps
    end
  end
end
