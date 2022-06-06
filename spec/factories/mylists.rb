FactoryBot.define do
  factory :mylist do
    title { Faker::Commerce.product_name }
    start_time { '2023-01-01 11:00:00' }
    text { Faker::Lorem.sentence }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
