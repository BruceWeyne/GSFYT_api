Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :home, only: %i[index]
  resources :home

  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :destroy]
      resources :youtube, only: [:create]

      # Authentication
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      namespace :auth do
        resources :sessions, only: %i[index]
      end  # namespace :auth

    end # namespace :v1
  end # namespace :api

end # Class
