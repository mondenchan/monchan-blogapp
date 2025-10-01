Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'articles#index'
  resources :articles do
<<<<<<< HEAD
    resources :comments, only: [:new, :create, :destroy]
=======
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]

>>>>>>> 814fc0bc0384476bec993dac7d2b5a8d50c82a8b
  end
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
