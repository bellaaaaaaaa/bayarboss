Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  root 'welcome#index'

  # Sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/users/:id/new_item', to: 'users#new_item', as:'new_item'

  resources :users, controller:'users'

  # Routes for user items
  resources :users do
    resource :items
  end

end
