class RoyaltyOwner < ActiveRecord::Base

  has_many :publishing_houses

  belongs_to :royaltyowner_product_map

  attr_accessible :address, :address2, :city, :fax, :first_name, :last_name, :other_name, :phone, :publishing_house_id, :state, :type, :zip
end
