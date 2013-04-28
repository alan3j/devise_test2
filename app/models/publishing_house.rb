class PublishingHouse < ActiveRecord::Base

  has_many :royalty_owners

  has_many :royaltyowner_product_maps, :through => :royalty_owners

  attr_accessible :address, :address2, :city, :contact_name, :fax, :name, :phone, :state, :abbreviation, :zip
end
