Rails.application.routes.draw do
  root "welcome#show"

  get "/auth/github", as: :github_login

  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:index, :show]
  resources :repos, only: [:index, :show]
  resources :welcome, only: [:show]
end
