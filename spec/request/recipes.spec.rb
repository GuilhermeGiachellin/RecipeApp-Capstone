require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
   
   before(:all) do
        @user = User.new(name: 'Guy', email: 'e@e.com',
                         password: 'Lorem11111', password_confirmation: 'Lorem11111' )
        @user.save
        @recipe = Recipe.new(user_id: @user.id, name: 'recipe 1',
                            description: 'Lorem ipsum',
                            preparation_time: 1, cooking_time: 1, public: true)
                            
        @recipe.save
        p "CONSOLELOG"
        p @recipe
    end 
    
  describe 'GET #public_recipes' do 
    before { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'public_recipes' template" do
      expect(response).to render_template('public_recipes')
    end
    it 'have the right text' do
      expect(response.body).to include('Public Recipes')
    end
  end

  describe 'GET #show' do
    before { get recipe_path(@recipe) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it 'have the right text' do
      expect(response.body).to include('recipe 1')
    end
  end
  
end