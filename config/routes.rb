Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index" 
   
   get '/createReaction/:id', to: 'user#createReaction'
  post '/createComment/:id', to: 'user#createComment'
  post '/createPost', to: 'user#createPost'
  get '/loadMore', to: 'user#pagination'
   resources :user


end
