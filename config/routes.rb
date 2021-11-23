Rails.application.routes.draw do
  resources :foods
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'recipes#public_recipes'
  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end
end
