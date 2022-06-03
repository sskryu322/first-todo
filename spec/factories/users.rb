FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name  { '山田' }
    last_name { '太郎' }
    department { Faker::Company.name }
    position { Faker::Company.name }
  end
end
