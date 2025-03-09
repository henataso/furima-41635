class OrderAddressForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :region_of_origin_id, :city, :house_number, :building_name, :tell, :price,
                :token

  validates :user_id, :item_id, :region_of_origin_id, :city, :house_number, :price, :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む形式で入力してください' }
  validates :tell, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
  def save
    order = Order.create(user_id: user_id, item_id: item_id, price: price)
    Address.create(order_id: order.id, user_id: user_id, postal_code: postal_code, region_of_origin_id: region_of_origin_id, city: city, house_number: house_number,
                   building_name: building_name, tell: tell)
  end
end
