Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :images, only: [:show, :create]

  resources :posts do 
    resources :comments, only: [:create, :update], module: :posts
  end

  resources :comments do 
    resources :comments, only: [:create, :update],  module: :comments
  end

  resources :users do 
    scope module: :users do
      resources :pseudonyms, only: [:index, :new, :create]
    end
  end
end
