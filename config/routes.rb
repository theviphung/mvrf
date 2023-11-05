Rails.application.routes.draw do
  root to: "general#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    get "about-us", to: "general#about-us"
    get "faqs", to: "general#faqs"
    get "search", to: "general#search"
    get "index", to: "general#index"

    get "login", to: "sessions#login"
    get "my-account", to: "user#myaccount"
    get "sign-up", to: "users#new"
    post "sign-up", to: "users#create"

    resources :contacts
    get "new-contact", to: "contacts#new"
  
    resources :users
    get '/login', to: 'sessions#login'
    post '/login', to: 'sessions#create'
    post '/logout' , to: 'sessions#destroy'
    get '/logout', to: 'sessions#destroy'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  

end
