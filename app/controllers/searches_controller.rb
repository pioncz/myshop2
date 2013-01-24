class SearchesController < ApplicationController
  def create
  	  if params[:type1] == "1"
  	  	@q = Category.search(params[:q])
  	  	@results = @q.result(:distinct => true)
  	  	@type = 1
  	  elsif params[:type1] == "2"
  	  	if params[:type2] == "1"
  	  		@q = Product.search(:name_cont => params[:q][:name_cont])
  	  	elsif params[:type2] == "2"
  	  		@q = Product.search(:description_cont => params[:q][:name_cont])
  	  	elsif params[:type2] == "3"
  	  		@q = Product.search(:price_lt => params[:q][:name_cont])
  	  	elsif params[:type2] == "4"
  	  		@q = Product.search(:price_gt => params[:q][:name_cont])
  	  	end
  	  	@results = @q.result(:distinct => true)
  	  	@type = 2
  	  end
  	  render 'show'
  end

  def show
	  @q = Product.search(params[:q])
	  @products = @q.result(:distinct => true)
	  @results = nil
  end
 end