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
end
