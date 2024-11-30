Rails.application.routes.draw do
  resources :profiles
  get "artists/index"
  devise_for :users


  resources :posts, only: [ :index, :show ] do
    resources :comments
    get "/by_tag/:tag", to: "posts#by_tag", on: :collection, as: "tagged"
  end

  resources :collections, only: [ :index, :show ]
  resources :subscriptions, only: [ :create ]

  # Admin namespace
  namespace :admin do
    resources :collections, except: [ :index, :show ]
    resources :posts, except: [ :index, :show ] do
      resources :comments
    end
  end

  # API v1
  namespace :api, format: "json" do
    namespace :v1 do
      resources :posts, only: [ :index, :show ]
    end
  end

  get "static_pages/home"
  get "static_pages/output"
  get "/about", to: "static_pages#about"

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest



  # root path
  root "static_pages#home"
end




# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
# Can be used by load balancers and uptime monitors to verify that the app is live.
# Defines the root path route ("/")
