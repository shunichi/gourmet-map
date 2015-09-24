Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  resource :profile, only: %i(edit update)
  resources :users, only: %i(index show)
  resources :restaurants do
    resources :reviews, only: %i(create update destroy) do
      resources :comments
    end
  end
  resources :tags, only: %i(index)

  namespace :admin do
    resource :announce, only: %i(new create)
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
