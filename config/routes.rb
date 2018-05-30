Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :images, only: [:show, :create]

  resources :posts do 
    resources :comments, only: :create, module: :posts
  end

  resources :comments do 
    resources :comments, only: :create, module: :comments
  end

  resources :users do 
    scope module: :users do
      resources :pseudonyms, only: [:index, :new, :create]
    end
  end
end
