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

  t = Thread.new do
    while(true) do
      sleep 60
			DateTime.parse(product.deadline).strftime("%Y/%m/%d %H:%M")
			@product = Product.all
			@product.each do |data|
				data.update_attributes!(:restday=>(DateTime.parse("data.deadline")-DateTime.now).to_i)
			end

			@waitjoin = Product.where(:status=>2)
			@waitjoin.each do |data|
				sum = Join.where(:product_id=>data.id).sum(:quantity)
				buy = Buy.where(:product_id=>data.id)

				if buy[0].quantity == sum and DateTime.parse(data.deadline).to_i >= DateTime.now.to_i
						data.update_attributes!(:status=>3)
				elsif buy[0].quantity >= sum and DateTime.parse(data.deadline).to_i < DateTime.now.to_i
						data.update_attributes!(:status=>4)
				else
						data.update_attributes!(:status=>2)
				end

			end
		end
	end

	@waitbuy = Product.where(:status=>1)
	@success = Product.where(:status=>3)
	@unsuccess = Product.where(:status=>4)
	end

	def new
  	@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		if @product.save
			Join.create(:quantity=>@product.quantity, :user_id=>@product.user.id, :product_id=>@product.id, :productrequest=>true)
			@product.update_attributes!(:restday=>(DateTime.parse("#{@product.deadline}")-DateTime.now).to_i)
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
