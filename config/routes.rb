Rails.application.routes.draw do
  devise_for :users
  get "static_pages/home"
  get "static_pages/about"
  get "/about", to: "static_pages#about"


  resources :collections
  resources :posts do
    resources :comments
  end

namespace :admin do
  resources :posts, only: [ :index ]
end

  # root path
  root "static_pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end


# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
# Can be used by load balancers and uptime monitors to verify that the app is live.
# Defines the root path route ("/")
