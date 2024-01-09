Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => "background"
  end

  devise_for :users, skip: [ :registrations, :passwords, :confirmations ], controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  constraints subdomain: /.*api.*/ do
    namespace :api, path: nil do
      resources :exchanges, only: [ :index, :show ]
      resource :user, only: [ :show ]
    end
  end

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
