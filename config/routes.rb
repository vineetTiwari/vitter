Rails.application.routes.draw do
  
  resources :votes

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :tweets, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :update, :destroy]
  end
 root "tweets#index"
end
