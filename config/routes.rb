Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mainpages#index", as: "home"
  get "login", to: "login#index", as: "login"
  get "login/store", to: "login#store", as: "loginstore"
  get "forgotpassword", to: "login#forgotpass", as: "forgotpassword"
end
