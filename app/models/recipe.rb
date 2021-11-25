class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates_uniqueness_of :name
  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: true
  def recipe_price
    price = 0
    recipe_foods.includes([:food]).each do |recipe_food|
      price += (recipe_food.quantity * recipe_food.food.price)
    end
    price
  end
end
