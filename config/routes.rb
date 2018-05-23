Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users do
    scope module: :users do
      resources :posts, only: [:index, :new, :create]
    end
  end
end
