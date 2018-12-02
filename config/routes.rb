Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  root 'welcome#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post '/items/search' => 'items#search_all_items', as: 'search_items'


  # Sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/users/:id/new_item', to: 'users#new_item', as:'new_item'
  get '/users/:id/my_items', to: 'items#my_items', as:'my_items'

  # Routes for index page item categories
  get 'category/art_items', to: 'welcome#art_items', as:'art_items'
  get 'category/beauty_items', to: 'welcome#beauty_items', as:'beauty_items'
  get 'category/books_items', to: 'welcome#books_items', as:'books_items'
  get 'category/clothing_items', to: 'welcome#clothing_items', as:'clothing_items'
  get 'category/property_items', to: 'welcome#property_items', as:'property_items'
  get 'category/other_items', to: 'welcome#other_items', as:'other_items'


  resources :users, controller:'users'

  # Routes for user items
  resources :users do
    resource :items
  end

  post 'items/:id/bid', to: 'bids#create', as:'create_bid'

  resources :items, controller: 'items'

end
