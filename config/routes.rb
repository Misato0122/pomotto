Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks do
      member do
        get 'pomodoro_count'
      end
    end
    resources :users, only: :create
    resource :profile, only: %i[show update]
    resource :session, only: %i[create destroy] do
      collection do
        post 'guest_login'
      end
    end
    resource :pomodoro, only: :create do
      collection do
        get 'pomodoro_count'
      end
    end
    # post "oauth/callback", to: "oauths#callback"
    # get "oauth/callback", to: "oauths#callback"
    # get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider  
  end

  get '*path', to: 'home#index'
end
