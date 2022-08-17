Rails.application.routes.draw do
  get 'friends/new'
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index" 
   
   get '/createReaction/:id', to: 'user#createReaction'
  post '/createComment/:id', to: 'user#createComment'
  post '/createPost', to: 'user#createPost'
  get '/loadMore', to: 'user#pagination'
  get '/makefriends', to: 'user#makefriends'
  get '/friendrequests', to: 'user#friendrequests'
   resources :user
   resources :friend_requests
   resources :friends


end
