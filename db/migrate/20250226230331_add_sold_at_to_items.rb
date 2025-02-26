class AddSoldAtToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :sold_at, :datetime
  end
end
