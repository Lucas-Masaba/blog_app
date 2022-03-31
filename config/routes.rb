Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'

  post 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
 resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    resources :comments, only: [:create]
  end

end
