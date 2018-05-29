Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :images, only: [:show, :create]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  resources :users do 
    scope module: :users do
      resources :pseudonyms, only: [:index, :new, :create]
    end
  end
end
