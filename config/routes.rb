Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'articles#index'
  resources :articles
end
