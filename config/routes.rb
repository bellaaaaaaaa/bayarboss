Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  root 'welcome#index'

  # Sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, controller:'users'
end
