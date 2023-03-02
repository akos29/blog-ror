Rails.application.routes.draw do
  get 'home/about'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/show'

  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
