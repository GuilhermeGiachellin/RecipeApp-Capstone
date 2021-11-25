FactoryBot.define do
  factory :food do
    name { Faker::Name.name }
    measurament_unit { 'unit' }
    price { Faker::Number.within(range: 1..20) }
  end
end
