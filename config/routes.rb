Rails.application.routes.draw do
  devise_for :users
  
  resources :items, only: [:index, :new, :create]
  
  root "items#index"
end
