FactoryBot.define do
  factory :recipe_food do
    quantity { Faker::Number.within(range: 1..20) }
  end
end
