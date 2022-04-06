Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'users/index'

  post 'posts/new'
  post 'comments/:post_id', to: 'comments#create'
  post 'likes/:post_id', to: 'likes#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
 resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:destroy]
    end
  end

end
