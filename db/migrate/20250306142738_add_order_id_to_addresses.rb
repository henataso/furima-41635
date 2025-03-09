class AddOrderIdToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :order_id, :integer
  end
end
