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

	def edit
  	@join = Join.includes(:product).find(params[:id])
	end

	def update
  	@join = Join.find(params[:id])
		@join.update_attributes(params[:join])

		redirect_to backstage_index_path
	end

	def destroy
		@join = Join.find(params[:id])
		@join.destroy

		redirect_to backstage_index_path
	end

end
