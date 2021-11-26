require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = create(:user)
    @food = create(:food, user_id: @user.id)
  end

  it 'name should be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'measurament_unit should be present' do
    @food.measurament_unit = nil
    expect(@food).to_not be_valid
  end

  it 'price should be present' do
    @food.price = nil
    expect(@food).to_not be_valid
  end

  it 'price should be a number' do
    @food.price = 'I am a number'
    expect(@food).to_not be_valid
  end
end
