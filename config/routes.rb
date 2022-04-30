Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
  end

  post 'auth', to: 'auth#access_check'
  post 'auth/email', to: 'auth#get_email'
  post 'reset_password_token', to: 'auth#password_reset_token'

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup',
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations',
    }

  devise_scope :user do
    put 'reset_password', to: 'passwords#update'
  end
end
