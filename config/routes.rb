Rails.application.routes.draw do
  root to: "general#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    get "about-us", to: "general#about-us"
    get "faqs", to: "general#faqs"
    get "search", to: "general#search"
    get "index", to: "general#index"

    get "login", to: "user#login"
    get "my-account", to: "user#myaccount"
    get "sign-up", to: "user#sign-up"
    get "contact", to: "contact#new"
    post "contact", to: "contact#submitted"
    get "contact/submitted/:id", to: "contact#submitted", as: "submitted_contact"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
