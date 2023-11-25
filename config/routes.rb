Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  resources :books do
    member do
      delete 'destroy'
    end
  end

  resources :patrons
  resources :checkouts
end
