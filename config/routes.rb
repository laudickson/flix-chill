Rails.application.routes.draw do
  devise_for :users

  root to: 'welcomes#index'

  authenticate :user do
    resources :profiles, only: [:index, :show]
    resources :tvshows, only: [:create, :new]
    resources :watchedshows, only: [:create, :new]
  end
end
