class RoyaltyOwner < ActiveRecord::Base

  has_many :royaltyowner_product_maps

  belongs_to :publishing_house

  attr_accessible :address, :address2, :city, :fax, :first_name, :last_name, :other_name, :phone, :publishing_house_id, :state, :abbreviation, :zip

  #-- Option names available to search form
  def self.search_fields 
    [['Show ALL',''], 
     ['Type','abbreviation'], ['First Name','first_name'], 
     ['Last Name','last_name'], ['Other Name','other_name'], 
     ['Phone','phone'], ['City','city'], ['State','state'] ]
  end

  #-- Loads @royalty_owners in royalty_owners_controller.rb
  def self.search(search_field, search_term, per_page, page, order, associate)

    #-- Manage ambiguous column references
    order = order.gsub(/^abbreviation/,'royalty_owners.abbreviation') if 
      !order.nil? && order.index(/^abbreviation/)
    search_field = 'royalty_owners.abbreviation' if search_field == 'abbreviation'
    #-- Manage ambiguous column references
    order = order.gsub(/^city/,'royalty_owners.city') if 
      !order.nil? && order.index(/^city/)
    search_field = 'royalty_owners.city' if search_field == 'city'
    #-- Manage ambiguous column references
    order = order.gsub(/^state/,'royalty_owners.state') if 
      !order.nil? && order.index(/^state/)
    search_field = 'royalty_owners.state' if search_field == 'state'
    #-- Manage ambiguous column references
    order = order.gsub(/^zip/,'royalty_owners.zip') if 
      !order.nil? && order.index(/^zip/)
    search_field = 'royalty_owners.zip' if search_field == 'zip'

    if search_field.nil? or search_field == '' or search_term.nil?
      paginate :per_page => per_page, :page => page,
               :order => order,
               :include => associate
    else
      paginate :per_page => per_page, :page => page,
               :conditions => ["#{search_field} ilike ?", "%#{search_term}%"],
               :order => order,
               :include => associate
    end

  end
    
end
