Rails.application.routes.draw do
  root to: "general#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    get "about", to: "general#about"
    get "faqs", to: "general#faqs"
    get "search", to: "general#search"

    get "login", to: "user#login"
    get "myaccount", to: "user#myaccount"
    get "signup", to: "user#signup"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
