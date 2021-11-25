require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
    describe 'root page test' do
        before (:each) do
            @user = create(:user)
            @recipe = create(:recipe, user_id: @user.id) 
            
            visit new_user_session_path
            within('#new_user') do
              fill_in 'Email', with: @user.email
              fill_in 'Password', with: @user.password
            end
            click_button 'Log in'              
            visit foods_path
            click_link 'New Food'             
            fill_in 'food_name', with: 'Batata'
            fill_in 'food_measurament_unit', with: 'gr'
            fill_in 'food_price', with: 1
            click_button 'Create Food'           
        end

        it 'expects to see page title' do            
            expect(page).to have_content('Registered Foods')            
        end

        it 'expects to go to new food page' do            
            click_link 'New Food'      
            expect(page).to have_current_path(new_food_path)            
        end 
        
        it 'expects to create a new food and go to the index food page' do            
            expect(page).to have_current_path(foods_path)            
        end   
        
        it 'expects to create a new food and go to the index food page' do
            click_link 'Delete'
            expect(page).not_to have_content('Batata')            
        end  
    end    
end