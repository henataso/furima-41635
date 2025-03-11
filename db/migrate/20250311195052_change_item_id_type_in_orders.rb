class ChangeItemIdTypeInOrders < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :item_id, :bigint
  end
end