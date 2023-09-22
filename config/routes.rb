# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'orders#new'
  resources :orders, only: %i[new create]
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :dishes, only: :index
    end
  end
end
