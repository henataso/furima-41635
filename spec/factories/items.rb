FactoryBot.define do
  factory :item do
    itemname { Faker::Lorem.sentence }
    itemtext { Faker::Lorem.characters(number: 999) }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    region_of_origin_id { 2 }
    delivery_time_id { 2 }
    price { 500 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/og_image.jpg'), filename: 'og_image.jpg')
    end
  end
end
