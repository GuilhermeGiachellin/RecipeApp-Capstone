# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  email: 'admin@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin',
)
user.save!

user = User.new(
  email: 'guilherme@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Guilherme'
)
user.save!

user = User.new(
  email: 'gabriel@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Gabriel'
)
user.save!

(1..3).each do |id|
    Recipe.create!(
        name: Faker::Food.dish,
        preparation_time: Faker::Number.within(range: 1..5),
        cooking_time: Faker::Number.within(range: 1..5),
        description: Faker::Food.description,
        user_id: 1,
    )
end

(1..3).each do |id|
    Recipe.create!(
        name: Faker::Food.dish,
        preparation_time: Faker::Number.within(range: 1..5),
        cooking_time: Faker::Number.within(range: 1..5),
        description: Faker::Food.description,
        user_id: 2,
    )
end

(1..3).each do |id|
    Recipe.create!(
        name: Faker::Food.dish,
        preparation_time: Faker::Number.within(range: 1..5),
        cooking_time: Faker::Number.within(range: 1..5),
        description: Faker::Food.description,
        user_id: 3,
    )
end
  
(1..20).each do |id|
    Food.create!(
        name: Faker::Food.ingredient,
        measurament_unit: 'unit',
        price: Faker::Number.within(range: 1..20),
        user_id: rand(1..3),
    )
end

(1..9).each do |id|
    RecipeFood.create!(
        quantity: Faker::Number.within(range: 1..20),
        recipe_id: id,
        food_id: id,
    )
end

ActiveRecord::Base.connection.tables.each do |t|
ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
