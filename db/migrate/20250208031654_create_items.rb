class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string :itemname,             null: false
      t.text :itemtext ,              null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_cost_id,    null: false
      t.integer :region_of_origin_id, null: false
      t.integer :delivery_time_id,    null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
