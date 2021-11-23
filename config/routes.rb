Rails.application.routes.draw do
  resources :recipe_foods
  resources :foods
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'recipes#public_recipes'
  resources :recipes, :except => [:update]
end
