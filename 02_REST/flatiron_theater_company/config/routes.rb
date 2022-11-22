Rails.application.routes.draw do
  resources :productions, only: [:index, :show]

  namespace :admin do 
    resources :production, only: [:create, :update, :destroy]
  end 

  #'/welcome' 
  # production 
  # welcome
  get "/welcome", to: "productions#welcome" 
  get "/welcome/:user_name", to: "productions#name"
  # resources :users
end
