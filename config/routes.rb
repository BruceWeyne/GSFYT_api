Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :home, only: %i[index]
  resources :home

  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :destroy]
      resources :youtube, only: [:create]
    end
  end

end
