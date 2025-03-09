class OrderAddressForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :region_of_origin_id, :city, :house_number, :building_name, :tell, :price,
                :token

  validates :user_id, :item_id, :postal_code, :region_of_origin_id, :city, :house_number, :tell, :price, :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id, price: price)
    Address.create(order_id: order.id, user_id: user_id, postal_code: postal_code, region_of_origin_id: region_of_origin_id, city: city, house_number: house_number,
                   building_name: building_name, tell: tell)
  end
end
