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
		if @product.save
			Join.create(:quantity=>@product.quantity, :user_id=>@product.user.id, :product_id=>@product.id)
		end
		redirect_to product_index_path
	end

	def edit
  	@product = Product.find(params[:id])
		if @product.buy_id!=nil
			@buy = Buy.includes(:product).find(@product.buy_id)
		end
		@sum = Join.where(:product_id=>@product.id).sum(:quantity)
	end

	def update
		@product = Product.find(params[:id])
		@product.update_attributes(params[:product])

		#redirect_to product_path(@product)
		# action=> :show
		redirect_to backstage_index_path
	end

	def show
  	@product = Product.includes(:user).find(params[:id])
		if @product.buy_id!=nil
			@buy = Buy.find(@product.buy_id)
		end
		@join = Join.includes(:user).where(:product_id=>@product.id)
		@sum = Join.where(:product_id=>@product.id).sum(:quantity)
		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @product }
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to backstage_index_path
	end

end
