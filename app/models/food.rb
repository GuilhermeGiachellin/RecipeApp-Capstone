class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates_uniqueness_of :name

  def amount_food(current_user)
    value = 0
    recipes.each do |recipe|
      next unless recipe.user_id == current_user.id

      recipe.recipe_foods.each do |recipe_food|
        value += recipe_food.quantity if recipe_food.food.name == name
      end
    end
    value
  end
end
