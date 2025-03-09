class RenamePrefectureToRegionOfOriginId < ActiveRecord::Migration[7.1]
  def change
    rename_column :addresses, :prefecture, :region_of_origin_id
  end
end
