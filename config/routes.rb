Rails.application.routes.draw do
  root "welcome#show"

  get "/auth/github", as: :github_login

  get "/auth/github/callback", to: "sessions#create"
  post "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/user/:id", to: "users#show", as: "dashboard"

  get "/user/:id/tasks", to: "tasks#index", as: "tasks"
  get "/my_tasks", to: "tasks#index", as: "my_tasks"
  get "/user/:id/tasks/new", to: "tasks#new", as: "new_task"
  post "/user/:id/tasks", to: "tasks#create"
  get "/user/:id/tasks/:id", to: "tasks#show", as: "task"
  get "/user/:id/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "/user/:id/tasks/:id/edit", to: "tasks#update"
  delete "/user/:id/tasks/:id", to: "tasks#destroy", as: "delete_task"

  resources :welcome, only: [:show]
end
