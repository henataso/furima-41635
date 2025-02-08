class Item < ApplicationRecord
  validates :itemname, presence: true
  validates :itemtext, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :region_of_origin_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
shipping_cost_id
