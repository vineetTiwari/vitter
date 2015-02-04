Rails.application.routes.draw do
  
  resources :tweets do
    resources :replies, only: [:create, :destroy]
  end
 
 root "tweets#index"
end
