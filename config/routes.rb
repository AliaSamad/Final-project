Rails.application.routes.draw do
  root "welcome#index"

  # Sessions (login / logout)
  get    "/login",      to: "sessions#new"
  post   "/login",      to: "sessions#create"
  delete "/logout",     to: "sessions#destroy"
  get    "/logged_out", to: "sessions#logged_out", as: "logout_success"

  # User signup & account deletion
  resources :users, only: [:new, :create, :destroy]

  # Categories and ToDos
  resources :categories

  resources :todos do
    member do
      patch :toggle_complete
    end

    collection do
      get :completed
    end
  end
end
