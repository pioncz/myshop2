class Order < ActiveRecord::Base
	attr_accessible :confirmed
	has_many :order_items, :dependent => :destroy

	belongs_to :buyer
end