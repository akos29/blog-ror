Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  get 'comments/index'
  get 'comments/show'
  get 'home/about'
  
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts , only: [:index, :show, :new, :create] do
      resources :comments
      resources :likes, only: [:create, :destroy]
    end
  end

end
