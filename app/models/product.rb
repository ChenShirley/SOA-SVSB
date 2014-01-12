class Product < ActiveRecord::Base
	attr_accessible :productname, :description, :category, :quantity, :maxprice, :location, :deadline, :user_id, :buy_id, :status, :pic, :pic_file_name, :pic_content_type, :pic_file_size, :pic_updated_at, :restday
has_attached_file :pic, :styles => 
        { :medium => "300x300>", :thumb => "150x150>" }
#has_attached_file :attach
# status: 1=>wait for buyer; 2=>has one buyer, wait for joiner; 3=>buyer and joiner match, success in time; 4=> false, out of time

#search bar
  def self.search(search)  
    if search  
      find(:all, :conditions => ['productname LIKE ?', "%#{search}%"])  
    else  
      find(:all)  
    end  
  end 

	belongs_to :user
  has_many :buys, :dependent => :destroy
  has_many :joins, :dependent => :destroy
end
