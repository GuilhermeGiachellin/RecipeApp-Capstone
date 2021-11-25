require 'rails_helper'

RSpec.describe 'Root page', type: :feature do
  describe 'root page test' do
    before(:all) do
      @user = create(:user)
      @recipe = create(:recipe, user_id: @user.id)
    end

    it 'expects to see recipe name' do
      visit root_path
      expect(page).to have_content(@recipe.name)
    end

    it 'expects to see price content' do
      visit root_path
      expect(page).to have_content('Price =')
    end

    it 'expects to see page title' do
      visit root_path
      expect(page).to have_content('Public Recipes')
    end

    it 'expects to see click on recipe' do
      visit root_path
      click_link @recipe.name
      expect(page).to have_current_path(recipe_path(@recipe.id))
    end
  end
end
