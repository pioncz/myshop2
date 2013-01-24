class Admin::CategoriesController < Admin::AdminController
	def create
		Category.create(:name => params[:name])
		redirect_to :back
	end

	def destroy
		Category.destroy_all(:id => params[:id])
		redirect_to admin_root_path
	end

	def update
		@category = Category.find(params[:id]) 
		@category.name = params[:name]
		@category.save
		redirect_to admin_root_path
	end
end