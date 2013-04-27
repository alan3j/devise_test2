class RoyaltyownerProductMap < ActiveRecord::Base

  has_many :royalty_owners
  has_many :products

  has_many :publishing_houses, :through => :royalty_owners
  has_many :artists, :through => :products
  has_many :categories, :through => :products

  attr_accessible :amount, :incomplete_ammount, :notes, :product_id, :royalty_owner_id, :royalty_percentage, :royalty_type
end
