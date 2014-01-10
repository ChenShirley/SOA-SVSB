class ProductController < ApplicationController

	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

	def index
  	@product = Product.all
		@product = Product.search(params[:search]) 

    page = params[:page]
    if page == '1' #Food
      @product= Product.where(:category=>'food')
    elsif page == '2' #Toiletries
			@product = Product.where(:category=>'toiletries')
    elsif page == '3' #Stationary
			@product = Product.where(:category=>'stationary')
    end
	end

	def new
  	@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		@product.save

		redirect_to product_index_path
	end

	def edit
  	@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update_attributes(params[:product])

		redirect_to product_path(@product) # action=> :show
	end

	def show
  	@product = Product.includes(:user).find(params[:id])
		@buy = Buy.includes(:user).where(:product_id=>@product.id)
		@join = Join.includes(:user).where(:product_id=>@product.id)
		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @product }
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to product_index_path
	end

	def search
		@search = Product.where("productname=?",params[:product][:productname])
	end

end
