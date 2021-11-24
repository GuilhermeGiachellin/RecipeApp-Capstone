Rails.application.routes.draw do
  resources :foods
  devise_for :users

  root 'recipes#public_recipes'
  resources :shopping_cart, only: %i[index]
  resources :recipes do
    resources :recipe_foods
  end
end
