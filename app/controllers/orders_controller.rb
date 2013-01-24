class OrdersController < ApplicationController
  def show
  	check_user
  	@order = @buyer.orders.where(:confirmed => false).order("created_at").last
    if @order == nil
      @order = @buyer.orders.create
    end
  	@order_items = @order.order_items
  end

  def create
  	check_user
  	@order = @buyer.orders.where(:confirmed => false).order("created_at").last
    if @order == nil
      @order = @buyer.orders.create
    end
  	@order_items = @order.order_items.where(:product_id => params[:id])
  	@product = Product.find(params[:id])
  	if  @order_items == []
		@order.order_items.create(:product => @product, :quantity => 1, :price => @product.price)
	else
		@item = @order.order_items.where(:product_id => params[:id]).first
		@item.quantity += 1
		@item.price += @product.price
		@item.save
	end 
  	redirect_to order_path
  end

  def edit
  	check_user
  	render :text => "test"
  end
 end