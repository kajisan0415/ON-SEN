FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 400) }
    start_time { Faker::Lorem.characters(number: 20) }
    memo { Faker::Lorem.characters(number: 220) }
    user
  end
end
