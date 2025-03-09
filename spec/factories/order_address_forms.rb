FactoryBot.define do
  factory :order_address_form do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
    postal_code { '123-4567' }
    region_of_origin_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { 'ビル名' }
    tell { '09012345678' }
  end
end
