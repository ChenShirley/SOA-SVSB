class JoinController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def new
  	@join = Join.new
		@product_id = params[:product]
	end

	def create
		@join = Join.new(params[:join])
		@join.save

		redirect_to product_path(@join.product_id)
	end

end
