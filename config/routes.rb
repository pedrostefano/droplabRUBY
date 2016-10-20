Rails.application.routes.draw do
  resources :inventories
  resources :items
  devise_for :users
  root to: 'home#index'

end
