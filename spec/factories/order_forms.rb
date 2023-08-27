FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    send_origin_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token {'dummy_token'}
  end
end
