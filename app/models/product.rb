class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :category
  belongs_to :category
  has_many :comments
end