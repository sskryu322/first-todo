FactoryBot.define do
  factory :room do
    name { Faker::Name.last_name }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    association :user
  end
end
