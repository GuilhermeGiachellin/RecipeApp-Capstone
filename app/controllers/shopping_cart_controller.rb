class ShoppingCartController < ApplicationController
  def index
    @current_user = current_user
    @foods = Food.includes(:recipes).where(recipes: { user_id: current_user.id })
  end
end
