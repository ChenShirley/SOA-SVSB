class Product < ActiveRecord::Base
	attr_accessible :productname, :description, :quantity, :maxprice, :location, :deadline, :pic_id, :user_id
	belongs_to :user
end
