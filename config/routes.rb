Rails.application.routes.draw do
   root 'users#index'
   post '/users' => "users#create"
   get '/users/:id' => "users#show"   
   
   post '/sessions' => "sessions#create"
   delete '/sessions' => "sessions#destroy"  
   
   get '/secrets' => "secrets#index"
   delete '/secrets/:id' => "secrets#destroy"
   post 'secrets' => "secrets#create"
 
   get '/likes/:id' => "likes#create"
   delete '/likes/:id' => "likes#destroy"
    
end
