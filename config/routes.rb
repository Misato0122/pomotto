Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks do
      member do
        get 'pomodoro_count'
      end
    end
    resources :users, only: :create # do
    #   collection do
    #     post 'guest_login'
    #   end
    # end
    resource :profile, only: %i[show update]
    resource :session, only: %i[create destroy]
    resource :pomodoro, only: :create do
      collection do
        get 'pomodoro_count'
      end
    end
  end

  get '*path', to: 'home#index'
end
