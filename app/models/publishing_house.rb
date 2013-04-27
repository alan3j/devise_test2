class PublishingHouse < ActiveRecord::Base

  belongs_to :royalty_owner

  has_many :royaltyowner_product_maps, :through => :royalty_owners

  attr_accessible :address, :address2, :city, :contact_name, :fax, :name, :phone, :state, :abbreviation, :zip
end
