Rails.application.routes.draw do
  devise_for :users
  
  resources :items, only: [:index, :new, :create, :edit, :update, :show]
  
  root "items#index"
end
