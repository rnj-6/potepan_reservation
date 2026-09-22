Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # マイページ
  get "users", to: "users#show"

  # プロフィール
  get "users/profile", to: "users#profile"
  get "users/profile/edit", to: "users#profile_edit"
  patch "users/profile", to: "users#profile_update"

  # アカウント
  get "users/account", to: "users#account"
  get "users/account/edit", to: "users#account_edit"
  patch "users/account", to: "users#account_update"

  get "/search", to: "searches#search"

  # 施設一覧
  resources :rooms do
    resources :reservations do
      post :confirm, on: :collection
    end
  end

  # トップページ
  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
end
