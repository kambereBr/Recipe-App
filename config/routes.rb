Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :shopping_list, only: %i[index]
  resources :recipe_foods, only: %i[new create]
  resources :inventory_foods, only: %i[new create]
  get 'public_recipes', to: 'public_recipes#index'
end
