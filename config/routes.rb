Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :images, only: [:show, :create]

  resources :posts, only: [:index, :show, :new, :create]
end
