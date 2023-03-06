Rails.application.routes.draw do
  get 'home/about'
  
 
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', path: 'authors' do 
  #   get 'posts', to: 'posts#index'
  #   get 'posts/:id', to: 'posts#show'
  # end
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  


  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
