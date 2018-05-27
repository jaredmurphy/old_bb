Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :images, only: [:show, :create]

  resources :users do
    scope module: :users do
      resources :posts, only: [:index, :show, :new, :create]
    end
  end
end
