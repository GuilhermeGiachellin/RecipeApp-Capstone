require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:all) do
    @user = create(:user)
    @recipe = create(:recipe, user_id: @user.id)
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

  describe 'GET #recipe#show' do
    before { get recipe_path(@recipe) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'have the right text' do
      expect(response.body).to include(@recipe.name)
    end
  end
end
