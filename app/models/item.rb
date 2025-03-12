class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost, class_name: 'ShippingCost'
  belongs_to_active_hash :region, foreign_key: 'region_of_origin_id', class_name: 'Region'
  belongs_to_active_hash :delivery_time, class_name: 'DeliveryTime'

  belongs_to :user
  has_one :order

  has_one_attached :image

  validates :itemname, presence: true
  validates :itemtext, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be ---" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be ---" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be ---" }
  validates :region_of_origin_id, presence: true, numericality: { other_than: 1, message: "can't be ---" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be ---" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :user, presence: true
  validate :price_must_be_half_width
  validate :image_presence

  def sold_out?
    order.present?
  end

  private

  def price_must_be_half_width
    return unless price.present? && (price.to_s =~ /[０-９]/)

    errors.add(:price, 'must be half-width digits')
  end

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end
end
