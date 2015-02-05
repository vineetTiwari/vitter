Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :tweets, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
 root "tweets#index"
end
