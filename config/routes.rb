# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :expenditures, only: [:index, :create, :new]
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
