Advsurf::Application.routes.draw do

  resources :authentications

  match '/auth/:provider/callback' => 'authentications#create'
  match '/users/auth/:provider/callback' => 'authentications#create'
  #match '/users/auth/:provider/callback' => 'sessions#create'
  match '/signup', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
  match '/registrations' => 'registrations#email'

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
  resources :authentications
end