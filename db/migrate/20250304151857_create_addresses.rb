class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :region_of_origin_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :tell, null: false
      t.timestamps
    end
  end
end
