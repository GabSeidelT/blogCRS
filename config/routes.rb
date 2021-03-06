Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :categories
  resources :roles
  resources :posts
  resources :ratings
  resources :comments
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users
  
  post '/create/user', to: 'users#create', as: 'user_create'
  get '/post/:id', to: 'home#post', as: 'home_post'
end
