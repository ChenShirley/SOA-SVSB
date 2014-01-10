class BuyController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def new
  	@buy = Buy.new
		@product_id = params[:product]
	end

	def create
		@buy = Buy.new(params[:buy])
		@buy.save

		redirect_to product_path(@buy.product_id)
	end

	def edit
  	@buy = Buy.find(params[:id])
	end

	def update
  	@buy = Buy.find(params[:id])
		@buy.update_attributes(params[:buy])

		redirect_to backstage_index_path
	end

end
