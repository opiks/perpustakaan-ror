Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mainpages#index", as: "home"

  # harusnya only guest
  get "login", to: "login#index", as: "login"
  post "login/store", to: "login#store", as: "loginstore"
  get "forgotpassword", to: "login#forgotpass", as: "forgotpassword"
  post "forgotpassword/store", to: "login#forgotpassstore", as: "forgotpasswordstore"
  get "forgotpassword/edit", to: "login#forgotpassedit", as: "forgotpassedit"
  patch "forgotpassword/update", to: "login#forgotpassupdate", as: "forgotpassupdate"


  delete "logout", to: "login#logout", as: "logout"

  # harusnya only admin
  namespace :admin do
    get "dashboard", to: "dashboard#index", as: "dashboard"
  end
end
