Rails.application.routes.draw do
  devise_for :users


  resources :posts, only: [ :index, :show ]
  resources :collections, only: [ :index, :show ]

  namespace :admin do
    resources :collections, except: [ :index, :show ]
    resources :posts, except: [ :index, :show ] do
      resources :comments
    end
  end

  get "static_pages/home"
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
