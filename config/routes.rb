Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks
    resources :users, only: :create
    resource :profile, only: %i[show update]
    resource :session, only: %i[create destroy]
  end

  get '*path', to: 'home#index'
end
