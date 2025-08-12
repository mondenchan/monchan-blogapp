Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'articles#index'
  resources :articles
end