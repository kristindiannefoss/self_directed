Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'

  get '/signout' => 'sessions#destroy', :as => :signout

  get '/signin' => 'sessions#new', :as => :signin

  # root "welcome#show"
  #
  # get "/auth/facebook", as: :facebook_login
  #
  # get "/auth/facebook/callback", to: "sessions#create"
  # get "/logout", to: "sessions#destroy"
  #
  # resources :users, only: [:index, :show]
  # resources :repos, only: [:index, :show]
  # resources :welcome, only: [:show]
end
