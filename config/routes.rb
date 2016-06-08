Rails.application.routes.draw do
  root "welcome#show"

  get "/auth/pinterest", as: :pinterest_login

  get "/auth/pinterest/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:index, :show]
  resources :repos, only: [:index, :show]
  resources :welcome, only: [:show]
end
