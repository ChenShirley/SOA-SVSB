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

end
