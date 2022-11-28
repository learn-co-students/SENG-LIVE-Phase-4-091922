Rails.application.routes.draw do
 
  resources :tickets, only: [:index, :show, :create]
  resources :users, only: [:index, :show]
  resources :cast_members, only: [:index, :show]
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  # Custome Route 
 
  

end
