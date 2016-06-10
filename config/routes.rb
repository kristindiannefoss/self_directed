Rails.application.routes.draw do
  root "welcome#show"

  get "/auth/github", as: :github_login

  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/user/:id", to: "users#show", as: "dashboard"

  get "/users/:user_id/tasks", to: "tasks#index", as: "tasks"
  post "/users/:user_id/tasks", to: "tasks#create"
  get "/users/:user_id/tasks/new", to: "tasks#new", as: "new_task"
  get "/users/:user_id/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  get "/users/:user_id/tasks/:id", to: "tasks#show", as: "task"
  patch "/users/:user_id/tasks/:id", to: "tasks#update", as: "update_task"
  put "/users/:user_id/tasks/:id", to: "tasks#update"
  delete "/users/:user_id/tasks/:id", to: "tasks#destroy", as: "delete_task"

  resources :welcome, only: [:show]
end
