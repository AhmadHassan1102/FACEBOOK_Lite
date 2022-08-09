Rails.application.routes.draw do
  get 'user/show'
  get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

   
   get '/register', to: 'user#register'
   get '/login', to: 'user#login'
   get '/logout', to: 'user#destroy'
   post '/login', to: 'user#verifyuser'
   post '/saveUser', to: 'user#saveUser'
   resources :user


end
