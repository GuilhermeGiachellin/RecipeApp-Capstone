require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = create(:user)
    @recipe = create(:recipe, user_id: @user.id)
  end

  it 'name should be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be present' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be present' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'description should be present' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be a number' do
    @recipe.preparation_time = 'I am a number'
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be a number' do
    @recipe.cooking_time = 'I am a number'
    expect(@recipe).to_not be_valid
  end
end
