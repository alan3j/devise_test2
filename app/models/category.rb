class Category < ActiveRecord::Base

  belongs_to :product

  has_many :royaltyowner_product_map, :through => :products

  attr_accessible :name
end
