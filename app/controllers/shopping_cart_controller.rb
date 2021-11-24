class ShoppingCartController < ApplicationController
  def index
    @foods = Food.includes(:recipes).where(recipes: { user_id: current_user.id })
  end
end
