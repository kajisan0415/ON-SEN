FactoryBot.define do
  factory :article do
    name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    address_city { Faker::Lorem.characters(number: 20) }
    tax { Faker::Lorem.characters(number: 20) }
    opening_hours { Faker::Lorem.characters(number: 20) }
    image_id { Faker::Lorem.characters(number: 10) }
    closed { Faker::Lorem.characters(number: 20) }
    admin
  end
end
