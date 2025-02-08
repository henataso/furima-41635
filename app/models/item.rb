class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_cost_id
  belongs_to :region_of_origin_id
  belongs_to :delivery_time_id

  validates :itemname, presence: true
  validates :itemtext, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_of_origin_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
shipping_cost_id
