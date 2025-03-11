class AddOrderIdToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :order_id, foreign_key: true, null: false
  end
end
