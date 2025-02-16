class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost, class_name: 'ShippingCost'
  belongs_to_active_hash :region, class_name: 'Region'
  belongs_to_active_hash :delivery_time, class_name: 'DeliveryTime'

  belongs_to :user

  has_one_attached :image

  validates :itemname, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :itemtext, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_of_origin_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true, unless: :was_attached?, numericality: { other_than: 1, message: "can't be blank" }

  def was_attached?
    image.attached?
  end
end
