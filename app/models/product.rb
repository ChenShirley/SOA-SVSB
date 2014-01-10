class Product < ActiveRecord::Base
	attr_accessible :productname, :description, :category, :quantity, :maxprice, :location, :deadline, :user_id, :pic, :pic_file_name, :pic_content_type, :pic_file_size, :pic_updated_at
has_attached_file :pic, :styles => 
        { :medium => "300x300>", :thumb => "100x100>" }
#has_attached_file :attach

#search bar
  def self.search(search)  
    if search  
      find(:all, :conditions => ['productname LIKE ?', "%#{search}%"])  
    else  
      find(:all)  
    end  
  end 

	belongs_to :user
end
