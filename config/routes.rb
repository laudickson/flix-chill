Rails.application.routes.draw do
  devise_for :users

  root to: 'welcomes#index'

  authenticate :user do
    resources :profiles, only: [:index, :show]
    resources :watchedshows, only: [:create]
    resources :matches, only: [:index]
  end
  resources :friendships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end
end
