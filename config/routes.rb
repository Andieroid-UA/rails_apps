Rails.application.routes.draw do
#   # localhost:3000/users
#  # Go to users_controller.rb and look for index method
#   get '/users', to: 'users#index'

#   # localhost:3000/users/1
#   get '/users/:id', to: 'users#show'

#   # localhost:3000/users/1/posts
#   post '/users', to: 'users#create'

#   # localhost:3000/users/1
#   put '/users/:id', to: 'users#update'

#   # localhost:3000/users/1
#   delete '/users/:id', to: 'users#destroy'
# end
#------Customized Route (Updated 2-8-24)---------
  scope '/' do
    post 'login', to: 'sessions#create'
  end

  resources :events
  scope :profiles do
    get ':username', to: 'profiles#show'
  end
  resources :posts
  resources :users do
    get 'posts', to: 'users#posts_index'
  end
end
#--------------------------------------------------------------------------
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #root "application#index"
