Rails.application.routes.draw do

  resources :inventories, shallow: true do
    resources :items
  end

  devise_for :users
  root to: 'home#index'

end
