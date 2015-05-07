Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  resources :users, only: %i(index show)
  resources :restaurants do
    resources :reviews, only: %i(create update destroy)
  end
  resources :tags, only: %i(index)
end
