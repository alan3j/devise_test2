class ChangeFieldnameTypeForPublishingHouses < ActiveRecord::Migration
  change_table :publishing_houses do |t|
    t.rename :type, :abbreviation
  end  
end
