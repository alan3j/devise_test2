class Product < ActiveRecord::Base

  has_many :artists
  has_many :categories

  belongs_to :royaltyowner_product_map

  attr_accessible :artist_id, :category_id, :key1, :key2, :key3, :media_type, :new_price, :new_release, :old_price, :price, :rank, :spcn, :title, :upc
end
