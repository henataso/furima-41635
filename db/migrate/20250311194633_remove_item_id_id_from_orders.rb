class RemoveItemIdIdFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :item_id_id, :integer
  end
end
