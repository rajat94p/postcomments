Rails.application.routes.draw do
  root "homes#index"


  resources :sessions

  post '/signup', to: 'users#create', as: 'signup'


  get "/signin", to: 'sessions#new', as: 'new_signin'
  post '/signin',  to: "sessions#create", as: 'signin'
  get '/signout', to: "sessions#destroy"


  

  resources :users do  
    resources :posts do
      resources :comments 
    end
  end
end
