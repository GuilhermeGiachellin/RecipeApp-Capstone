class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def recipe_price
    price = 0
    recipe_foods.each do |recipe_food|
      price += (recipe_food.quantity * recipe_food.food.price)
    end
    price
  end
end
