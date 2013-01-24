class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_user
    if !cookies[:buyer_id]
      @buyer = Buyer.create(:first_name => nil, :last_name => nil)
      cookies[:buyer_id] = { :value => @buyer.id, :expires => 1.month.from_now }
    else
      @buyer = Buyer.find(cookies[:buyer_id])
    end
  end
end
