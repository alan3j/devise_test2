class ChangeFieldnameTypeForRoyaltyOwners < ActiveRecord::Migration
  change_table :royalty_owners do |t|
    t.rename :type, :abbreviation
  end
end
