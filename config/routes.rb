Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => 'background'
  end

  devise_for :users, skip: [:registrations, :passwords, :confirmations], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   #get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
  #   get 'sign_up', to: redirect('/users/sign_in'), as: :new_user_registration
  #   get 'password/new', to: redirect('/users/sign_in'), as: :new_user_password
  #   get 'confirmation/new', to: redirect('/users/sign_in'), as: :new_user_confirmation
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "dashboard" => "pages#dashboard", as: :dashboard

  # Defines the root path route ("/")
  root "pages#index"
end
