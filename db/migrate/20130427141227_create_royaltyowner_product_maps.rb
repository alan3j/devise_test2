class CreateRoyaltyownerProductMaps < ActiveRecord::Migration
  def change
    create_table :royaltyowner_product_maps do |t|
      t.integer :royalty_owner_id
      t.integer :product_id
      t.decimal :royalty_percentage
      t.string :royalty_type
      t.decimal :amount
      t.decimal :incomplete_ammount
      t.text :notes

      t.timestamps
    end
  end
end
