Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
  root 'posts#index'

  delete 'posts/:id/delete' => 'posts#destroy', as: 'posts_delete'
  get '/posts/:id/delete' => 'posts#destroy'

# delete '/posts/:post_id/comments/:id/delete' => 'comments#destroy', as: 'comments_delete'
# get '/posts/:post_id/comments/:id/' => 'comments#show'

  get '/about', to: 'pages#about'
end
