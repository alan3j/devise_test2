class Category < ActiveRecord::Base

  has_many :products

  has_many :royaltyowner_product_maps, :through => :products

  attr_accessible :name
end
