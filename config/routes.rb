Rails.application.routes.draw do
  get 'public_recipes/idnex'
  get 'foods/index'
  root "recipes#index"

  devise_for :users
  resources :recipes
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods
  resources :shopping_list, only: %i[index]
  resources :recipe_foods, only: %i[new create destroy]
  resources :inventory_foods, only: %i[new create]
  get 'public_recipes', to: 'public_recipes#index'

end
