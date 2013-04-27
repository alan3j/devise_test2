class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :title
      t.integer :artist_id
      t.integer :category_id
      t.string :upc
      t.string :spcn
      t.decimal :price
      t.string :media_type
      t.boolean :new_release
      t.string :key1
      t.string :key2
      t.string :key3
      t.integer :rank
      t.decimal :old_price
      t.decimal :new_price

      t.timestamps
    end
  end
end
