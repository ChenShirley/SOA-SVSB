class BackstageController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def index
  	@buy = Buy.includes(:product).includes(:user).where(:user_id=>current_user.id)
  	@join = Join.includes(:product).includes(:user).where(:user_id=>current_user.id, :productrequest=>false)
  	@myrequest = Join.includes(:product).includes(:user).where(:user_id=>current_user.id, :productrequest=>true)
  	#@product = Product.includes(:user).where(:user_id=>current_user.id)
	end

end
