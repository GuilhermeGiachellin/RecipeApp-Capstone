class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates_uniqueness_of :name

  def amount_food
    RecipeFood.joins(:food).where(food_id: id).sum('quantity')
  end
end
