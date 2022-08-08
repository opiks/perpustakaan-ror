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

    #crud genre
    get "genre", to: "genre#index", as: "genre_index"
    get "genre/add", to: "genre#add", as: "genre_add"
    post "genre/store", to: "genre#store", as: "genre_store"
    get "genre/destroy/:id", to: "genre#destroy", as: "genre_delete"
    get "genre/edit/:id", to: "genre#edit", as: "genre_edit"
    patch "genre/edit/:id", to: "genre#update", as: "genre_update"

    #crud lokasi
    get "location", to: "lokasi#index", as: "location_index"
    get "location/add", to: "lokasi#add", as: "location_add"
    post "location/store", to: "lokasi#store", as: "location_store"
    get "location/destroy/:id", to: "lokasi#destroy", as: "location_delete"
    get "location/edit/:id", to: "lokasi#edit", as: "location_edit"
    patch "location/update/:id", to: "lokasi#update", as: "location_update"

    #crud tipe
    get "type", to: "tipe#index", as: "type_index"
    get "type/add", to: "tipe#add", as: "type_add"
    post "type/store", to: "tipe#store", as: "type_store"
    get "type/destroy/:id", to: "tipe#destroy", as: "type_delete"
    get "type/edit/:id", to: "tipe#edit", as: "type_edit"
    patch "type/update/:id", to: "tipe#update", as: "type_update"

    #crud member
    get "member", to: "member#index", as: "member_index"
    get "member/add", to: "member#add", as: "member_add"
    post "member/store", to: "member#store", as: "member_store"
    get "member/destroy/:id", to: "member#destroy", as: "member_delete"
    get "member/edit/:id", to: "member#edit", as: "member_edit"
    patch "member/update/:id", to: "member#update", as: "member_update"

    #crud buku
    get "book", to: "book#index", as: "book_index"
    get "book/add", to: "book#add", as: "book_add"
    post "book/store", to: "book#store", as: "book_store"
    get "book/destroy/:id", to: "book#destroy", as: "book_delete"
    get "book/edit/:id", to: "book#edit", as: "book_edit"
    patch "book/update/:id", to: "book#update", as: "book_update"

    #crud buku
    get "borrower", to: "borrower#index", as: "borrower_index"
    get "borrower/add", to: "borrower#add", as: "borrower_add"
    post "borrower/store", to: "borrower#store", as: "borrower_store"
  end
end
