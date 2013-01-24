class CommentsController < ApplicationController
  def create
    if user_signed_in?
    	@product = Product.find(params[:id])
    	@commenter = ""
    	@commenter += current_user.imie if current_user.imie != nil
    	@commenter += " " if current_user.imie != nil
    	@commenter += current_user.nazwisko if current_user.nazwisko != nil
    	@comment = @product.comments.create(:commenter=>@commenter,:body=>params[:body])
    else
    end
    redirect_to(request.env["HTTP_REFERER"])
  end
end