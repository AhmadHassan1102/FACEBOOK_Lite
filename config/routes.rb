Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users
  get 'reaction/new'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index"
   
  #  get '/register', to: 'user#register'
  #  get '/login', to: 'user#login'
  #  delete '/logout', to: 'user#destroy'
  #  post '/login', to: 'user#verifyuser'
  #  post '/saveUser', to: 'user#saveUser'
   get '/createReaction/:id', to: 'user#createReaction'
  post '/createComment/:id', to: 'user#createComment'
  post '/createPost', to: 'user#createPost'
  get '/loadMore', to: 'user#pagination'
   resources :user


end
