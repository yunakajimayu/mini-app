Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update]
  get "posts/:id/edit" => "posts#edit"
  patch 'posts/:id' => 'posts#update'
  post '/complete' => 'posts#create'
  post '/login' => 'posts#login'   
  get '/complete_path' => 'posts#create'
  post "posts/:id" => "posts#edit"
end