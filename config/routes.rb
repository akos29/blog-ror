Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'home/about'
  
 
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  #   get 'posts', to: 'posts#index'
  #   get 'posts/:id', to: 'posts#show'
  # end
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :show]
      resources :likes, only: [:index, :show]
    end
  end
  # resource :users, only: [:index, :show]  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
