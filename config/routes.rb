Rails.application.routes.draw do
  devise_for :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "home#index"

  # 7 deadly routes
  get     "/companies"           =>    "companies#index", as: "companies"
  get     "/companies/new"       =>    "companies#new", as: "new_company"
  post    "/companies"           =>    "companies#create"
  get     "/companies/:id"       =>    "companies#show", as: "company"
  get     "/companies/:id/edit"  =>    "companies#edit", as: "edit_company"
  put     "/companies/:id"       =>    "companies#update"
  patch   "/companies/:id"       =>    "companies#update"
  delete  "/companies/:id"       =>    "companies#destroy"

  resources :jobs
  resources :boats






end
