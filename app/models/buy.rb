class Buy < ActiveRecord::Base
	attr_accessible :quantity, :place, :user_id, :product_id
	belongs_to :user
	belongs_to :product
end
