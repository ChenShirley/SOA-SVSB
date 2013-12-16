class RequestController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def index
  	@request = Request.all
	end

	def new
  	@request = Request.new
	end

	def create
		@request = Request.new(params[:request])
		@request.save

		redirect_to request_index_path
	end

	def edit
  	@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
		@request.update_attributes(params[:request])

		redirect_to request_path(@request) # action=> :show
	end

	def show
  	@request = Request.includes(:user).find(params[:id])
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy

		redirect_to request_index_path
	end

	def search
	end

end
