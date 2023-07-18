Rails.application.routes.draw do
  get 'home/about'
  
  root 'users#index'
  resources :users do
    resources :posts, shallow: true
  end
  # resource :users, only: [:index, :show]  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
