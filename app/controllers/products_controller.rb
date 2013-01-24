class ProductsController < ApplicationController
  def show
  	check_user
    @product = Product.find(params[:id])
  end
 end