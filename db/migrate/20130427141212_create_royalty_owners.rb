class CreateRoyaltyOwners < ActiveRecord::Migration
  def change
    create_table :royalty_owners do |t|
      t.integer :publishing_house_id
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :other_name
      t.string :phone
      t.string :fax
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
