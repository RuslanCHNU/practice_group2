Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "pages/new", to: "pages#new"
  post "pages", to: "pages#create"
  root "pages#index"

  #resources :pages
end
