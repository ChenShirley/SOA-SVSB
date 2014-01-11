class BuyController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def new
  	@buy = Buy.new
		@product = Product.find(params[:product])
	end

	def create
		@buy = Buy.new(params[:buy])
		if @buy.save
			@product = Product.find(@buy.product_id)
			@product.update_attributes(:buy_id=>@buy.id)
		end
		redirect_to product_path(@buy.product_id)
	end

	def edit
  	@buy = Buy.includes(:product).find(params[:id])
	end

	def update
  	@buy = Buy.find(params[:id])
		@buy.update_attributes(params[:buy])

		redirect_to backstage_index_path
	end

	def destroy
		@buy = Buy.find(params[:id])
		@buy.destroy

		redirect_to backstage_index_path
	end

end
