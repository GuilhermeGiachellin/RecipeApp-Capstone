require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
    describe 'root page test' do
        before (:all) do
            @user = create(:user)
            @recipe = create(:recipe, user_id: @user.id)            
        end

        it 'expects to see recipe name' do
            visit recipe_path(@recipe.id)
            expect(page).to have_content(@recipe.name)            
        end

        it 'expects to see price description' do
            visit recipe_path(@recipe.id)
            expect(page).to have_content(@recipe.description)            
        end       

        it 'log-in and expects to go to add ingredients page' do  
            visit new_user_session_path
            within('#new_user') do
              fill_in 'Email', with: @user.email
              fill_in 'Password', with: @user.password
            end
            click_button 'Log in'          
            visit recipe_path(@recipe.id)
            click_link 'Add ingredient'
            expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe.id))           
        end

        it 'log-in and expects to go to shopping list page' do  
            visit new_user_session_path
            within('#new_user') do
              fill_in 'Email', with: @user.email
              fill_in 'Password', with: @user.password
            end
            click_button 'Log in'          
            visit recipe_path(@recipe.id)
            click_link 'Generate shopping list'
            expect(page).to have_current_path(shopping_cart_index_path)    
        end
    end    
end