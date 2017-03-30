Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :users, except: [:destroy]
    resources :sessions, only: [:create]
    post 'signup', to: 'users#create'
    post 'signin', to: 'sessions#create'
  end
end
