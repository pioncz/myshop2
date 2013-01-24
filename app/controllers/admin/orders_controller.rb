class Admin::OrdersController < Admin::AdminController
	def index
		@orders = Order.where(:confirmed => true)
		@categories = Category.all
		@products = Product.all
	end
end