FactoryBot.define do
  factory :purchase_shipment do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id{2}
    city { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    phone_num {'09012345678'}
  end
end
