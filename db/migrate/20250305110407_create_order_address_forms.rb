class CreateOrderAddressForms < ActiveRecord::Migration[7.1]
  def change
    create_table :order_address_forms do |t|

      t.timestamps
    end
  end
end
