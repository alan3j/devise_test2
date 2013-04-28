class RoyaltyownerProductMap < ActiveRecord::Base

  belongs_to :royalty_owner
  belongs_to :product

  has_one :artist, :through => :product
  has_one :category, :through => :product
  has_one :publishing_house, :through => :royalty_owner

  attr_accessible :amount, :incomplete_ammount, :notes, :product_id, :royalty_owner_id, :royalty_percentage, :royalty_type
end
