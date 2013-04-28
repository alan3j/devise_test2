class RoyaltyOwner < ActiveRecord::Base

  has_many :royaltyowner_product_maps

  belongs_to :publishing_house

  attr_accessible :address, :address2, :city, :fax, :first_name, :last_name, :other_name, :phone, :publishing_house_id, :state, :abbreviation, :zip
end
