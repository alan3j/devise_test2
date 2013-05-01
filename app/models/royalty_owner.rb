class RoyaltyOwner < ActiveRecord::Base

  has_many :royaltyowner_product_maps

  belongs_to :publishing_house

  attr_accessible :address, :address2, :city, :fax, :first_name, :last_name, :other_name, :phone, :publishing_house_id, :state, :abbreviation, :zip

  def self.search_fields 
    [['Show ALL',''], 
     ['Publishing House','publishing_house'], 
     ['Type','abbreviation'], ['First Name','first_name'], 
     ['Last Name','last_name'], ['Other Name','other_name'], 
     ['Phone','phone'], ['City','city'], ['State','state'] ]
  end

  def self.search(search_field, search_term, per_page, page, order)

    if search_field.nil? or search_field == '' or search_term.nil?
      paginate :per_page => per_page, :page => page, 
               :order => order
    else
      paginate :per_page => per_page, :page => page,
               :conditions => ["#{search_field} ilike ?", "%#{search_term}%"],
               :order => order
    end
  end

end
