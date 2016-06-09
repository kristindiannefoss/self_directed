Rails.application.routes.draw do
  root "welcome#show"

  get "/auth/github", as: :github_login

  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/user/:id", to: "users#show", as: "dashboard"
  resources :users, only: [:index]
  resources :repos, only: [:index, :show]
  resources :welcome, only: [:show]
end
