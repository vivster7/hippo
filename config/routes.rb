require 'sidekiq/web'

Hippo::Application.routes.draw do
  root to: "emails#new"

  resources :emails, only: [:show, :create, :new]
  
  mount Sidekiq::Web, at: '/sidekiq'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end
