Rails.application.routes.draw do
  root "welcome#index"

  # Sessions (login / logout)
  get    "/login",      to: "sessions#new"
  post   "/login",      to: "sessions#create"
  delete "/logout",     to: "sessions#destroy"
  get    "/logged_out", to: "sessions#logged_out", as: "logout_success"

  # User signup & account deletion
  resources :users, only: [:new, :create, :destroy]

  # Categories
  resources :categories

  # ToDos
  resources :todos do
    collection do
      get :completed
    end

    member do
      # PATCH /todos/:id/toggle_complete → todos#toggle_complete
      patch :toggle_complete
    end
  end
end

  
  
