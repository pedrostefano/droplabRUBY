Rails.application.routes.draw do

  resources :inventories #do #, shallow: true do
  resources :items

  devise_for :users
  root to: 'home#index'

end
