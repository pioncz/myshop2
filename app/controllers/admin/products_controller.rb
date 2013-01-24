class Admin::ProductsController < Admin::AdminController
	def create
		Product.create(:name => params[:name], :description => params[:description], :price => params[:price])
		redirect_to :back
	end

	def destroy
		Product.destroy_all(:id => params[:id])
		redirect_to admin_root_path
	end

	def update
		@product = Product.find(params[:id]) 
		@product.name = params[:name]
		@product.description = params[:description]
		@product.price = params[:price]
		@product.save
		redirect_to admin_root_path
	end
end