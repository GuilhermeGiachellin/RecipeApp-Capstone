FactoryBot.define do
  factory :recipe do
    name { Faker::Name.name }
    preparation_time { Faker::Number.within(range: 1..5) }
    cooking_time { Faker::Number.within(range: 1..5) }
    description { Faker::Lorem.sentence(word_count: 10) }
    public { true }
  end
end
