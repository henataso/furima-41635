class AddForeignKeyToOrdersForItem < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :orders, :items, column: :item_id
  end
end