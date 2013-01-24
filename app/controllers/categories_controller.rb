class CategoriesController < ApplicationController
  def show
  	check_user
    @category = Category.find(params[:id]) 
	@products = @category.products
  end
 end