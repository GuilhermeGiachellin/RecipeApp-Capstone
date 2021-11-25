require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = create(:user)
    @recipe = create(:recipe, user_id: @user.id)
    @food = create(:food, user_id: @user.id)
    @recipe_food = create(:recipe_food, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'quantity should be present' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'quantity should be a number' do
    @recipe_food.quantity = 'I am a number'
    expect(@recipe_food).to_not be_valid
  end
end
