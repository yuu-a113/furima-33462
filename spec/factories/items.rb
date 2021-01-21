FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    info{Faker::Lorem.sentence}
    category_id{rand(2..11)}
    condition_id{rand(2..7)}
    shipping_charge_id{rand(2..3)}
    prefecture_id{rand(2..48)}
    shipping_day_id{rand(2..3)}
    price{rand(300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end