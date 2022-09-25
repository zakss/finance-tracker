Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  #
  resource :stocks do
    collection do
      get :search
    end
  end
end
