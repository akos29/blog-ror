Rails.application.routes.draw do
  devise_for :users
  get 'about/index'
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  get 'comments/index'
  get 'comments/show'
  get 'home/about'
  get '/users', to: 'users#index'
  
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts , only: [:index, :show, :new, :create] do
      resources :comments
      resources :likes, only: [:create, :destroy]
    end
  end

end
