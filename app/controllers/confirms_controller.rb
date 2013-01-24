class ConfirmsController < ApplicationController
  def show
  	check_user
	  @order = @buyer.orders.where(:confirmed => false).order("created_at ASC").last
  	@order_items = @order.order_items
  end
  def create
  	check_user
  	@order = @buyer.orders.where(:confirmed => false).order("created_at ASC").last
  	@order.confirmed = true
  	@order.save
	  @buyer.first_name = params[:first_name]
	  @buyer.last_name = params[:last_name]
	  @buyer.save
  end
 end