Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :categories
  resources :roles
  resources :posts

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_for :readers, controllers: { confirmations: 'readers/confirmations', omniauth: 'readers/omniauth', passwords: 'readers/passwords', resgistrations: 'readers/registrations', sessions: 'readers/sessions', unlocks: 'readers/unlocks' }

  get '/signup', to: 'readers#new', as: 'readers_new'
  get '/post/:id', to: 'home#post', as: 'home_post'
end
