Rails.application.routes.draw do
  root to: "general#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    get "about-us", to: "general#about-us"
    get "faqs", to: "general#faqs"
    get "search", to: "restaurants#search"
    get "index", to: "general#index"

    resources :restaurants
    get "restaurants/:id", to: "restaurants#show"

    resources :contacts
    get "new-contact", to: "contacts#new"

    resources :users
    get 'login', to: 'sessions#login'
    post 'login', to: 'sessions#create'
    post 'logout' , to: 'sessions#destroy'
    get 'logout', to: 'sessions#logout'
    get "sign-up", to: "users#new"
    post "sign-up", to: "users#create"
    get "users/success", to: "users#success", as: "user_success"
    get "users/failure", to: "users#failure", as: "user_failure"
    get "sessions/success", to: "sessions#success", as: "session_success"
    get "sessions/error", to: "sessions#error", as: "session_error"
    get "my-account", to: "users#myaccount"
    get 'change-info', to: 'users#change_info', as: :change_info
    post '/modify_info', to: 'users#modify_info', as: :modify_info


    get '/admin-login', to: 'admins#new'
    post '/admin-login', to: 'admins#create'
    delete '/admin-logout', to: 'admins#destroy'

    get 'dashboards/index', to: 'dashboards#index', as: "admin_dashboard"
    get 'user_status', to: 'dashboards#user_status'
    get 'role_verification', to: 'dashboards#role_verification'
    get 'admin-restaurant_info', to: 'dashboards#restaurant_info'
    get 'admin-restaurant_review', to: 'dashboards#restaurant_review'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


end
