FactoryBot.define do
  factory :item do
    name {'aaaa'}
    description {'aaaa'}
    condition_id {'2'}
    send_cost_id {'2'}
    send_origin_id {'2'}
    send_time_id {'2'}
    category_id {'2'}
    price {'10000'}
    user_id {'1'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
