# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  scope :api, defaults: { format: :json } do
    resources :users, except: [:destroy]
    resources :sessions, only: %i(create destroy)
    post 'signup', to: 'users#create'
    post 'signin', to: 'sessions#create'
    post 'signout', to: 'sessions#destroy'
  end
end
