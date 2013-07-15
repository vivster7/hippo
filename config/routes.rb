require 'sidekiq/web'

Hippo::Application.routes.draw do
  root to: "emails#new"

  resources :emails, only: [:show, :create, :new]
  
  mount Sidekiq::Web, at: '/sidekiq'
end
