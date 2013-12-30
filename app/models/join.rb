class Join < ActiveRecord::Base
	attr_accessible :quantity, :deadline, :user_id, :product_id
	belongs_to :user
	belongs_to :product
end
