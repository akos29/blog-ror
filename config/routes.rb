Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/index'
  get 'comments/show'
  get 'home/about'
  
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts , only: [:index, :show, :new, :create] do
      resources :comments
      resources :likes, only: [:new, :create]
    end
  end

end
