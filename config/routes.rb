require 'sidekiq/web'

Hippo::Application.routes.draw do
  root to: "emails#new"

  resources :emails, only: [:show, :create, :new]
  
  mount Sidekiq::Web, at: '/sidekiq'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/uploads/email/image/*id/*image/history', to: 'emails#history', via: :get, as: 'history'
  match '/uploads/email/image/*id/*image', to: 'emails#authorized_show', via: :get 

end
