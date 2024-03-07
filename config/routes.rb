Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :authentication do
  end
  resources :users do
  end
  resources :blogs do 
  end  
  # resources :UserBlog do
  # end# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # get "up" => "rails/health#show", as: :rails_health_check
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'  
  # Defines the root path route ("/")
  post 'signup', to: 'authentication#signup'
  post 'login', to: 'authentication#login'
  get 'profile', to: 'authentication#profile'
  patch 'update', to: 'authentication#update'
  post 'verify_email', to: 'authentication#verify_email'
  # root "posts#index"
end
