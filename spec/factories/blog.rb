FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    start_time { Faker::Lorem.characters(number: 20) }
    memo { Faker::Lorem.characters(number: 20) }
    user
  end
end