Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  resources :restaurants do
    resources :reviews, only: %i(create update destroy)
  end
end
