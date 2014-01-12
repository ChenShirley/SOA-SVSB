class Join < ActiveRecord::Base
	attr_accessible :quantity, :user_id, :product_id, :buy_id, :productrequest
	belongs_to :user
	belongs_to :product
end
