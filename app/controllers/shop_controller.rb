class ShopController < ApplicationController

  def index
  	check_user
    @products = Product.all
    @categories = Category.all
	@q = Product.search(params[:q])
	@results = nil
	@random_product = Product.first(:offset => rand(Product.count))
  end
end