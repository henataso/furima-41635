class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost, class_name: 'ShippingCost'
  belongs_to_active_hash :region, class_name: 'Region'
  belongs_to_active_hash :delivery_time, class_name: 'DeliveryTime'

  belongs_to :user

  has_one_attached :image

  validates :itemname, presence: true
  validates :itemtext, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_of_origin_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validate :price_must_be_half_width
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  private

  def price_must_be_half_width
    return unless price.present? && (price.to_s =~ /[０-９]/)

    errors.add(:price, 'must be half-width digits')
  end
end
