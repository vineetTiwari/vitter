Rails.application.routes.draw do
  
  resources :tweets, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
 root "tweets#index"
end
