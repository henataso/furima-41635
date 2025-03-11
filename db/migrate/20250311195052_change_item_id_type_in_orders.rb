class ChangeItemIdTypeInOrders < ActiveRecord::Migration[6.0]
  def up
    change_column :orders, :item_id, :bigint
  end

  def down
    change_column :orders, :item_id, :integer
  end
end