Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books
  resources :patrons
  resources :checkouts do
    member do
      post 'return'
      post 'complete_return'
    end
  end

  resources :returns, only: [] do
    member do
      get 'return'
      patch 'complete_return'
    end
  end
end
