Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks
    resources :users, only: :create
    resource :profile, only: %i[show update]
    resource :session, only: %i[create destroy]
    resource :pomodoro, only: :create
  end

  get '*path', to: 'home#index'
end
