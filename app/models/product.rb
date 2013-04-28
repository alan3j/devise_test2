class Product < ActiveRecord::Base

  has_many :royaltyowner_product_maps

  belongs_to :artist
  belongs_to :category

  attr_accessible :artist_id, :category_id, :key1, :key2, :key3, :media_type, :new_price, :new_release, :old_price, :price, :rank, :spcn, :title, :upc
end
