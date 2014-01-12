class JoinController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def new
  	@join = Join.new
		@product = Product.find(params[:product])
		@buy = Buy.find(@product.buy_id)
		@sum = Join.where(:product_id=>params[:product]).sum(:quantity)
	end

	def create
		@join = Join.new(params[:join])
		@join.save

		redirect_to product_path(@join.product_id)
	end

	def edit
  	@join = Join.includes(:product).find(params[:id])
		@product = Product.find(@join.product_id)
		if @product.buy_id!=nil
			@buy = Buy.find(@product.buy_id)
		end
		@sum = Join.where(:product_id=>@join.product_id).sum(:quantity)
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
