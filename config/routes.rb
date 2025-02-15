Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }, only: [:sessions]
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }, only: [:sessions, :registrations]

  get 'admins/home' => 'admin_portals#index'
  get 'admins/show_registered_users' => 'admin_portals#show_registered_users'
  put 'admins/manage' => 'admin_portals#approve_user'
  get 'admins/view' => 'admin_portals#show_user'
  get 'admins/edit_user/:id/edit' => 'admin_portals#edit_user', as: 'edit_user'
  put 'admins/update_user/:id' => 'admin_portals#update_user'
  patch 'admins/update_user/:id' => 'admin_portals#update_user', as: 'update_user'
  get 'admins/add_user' => 'admin_portals#add_user'
  post 'admins/create_user' => 'admin_portals#create_user'
  get 'admins/show_pending_users' => 'admin_portals#show_pending_users'
 

  resources :trades, only: [:index]

  root 'pages#landing'

  # buy/sell transaction
  get '/stocks/:stock_code/trades/new' => 'trades#new', as: 'new_stock_trade'
  post '/stocks/:stock_code/trades' => 'trades#create', as: 'create_trade'

  #pages
  get '/home' => 'pages#home'
  get '/portfolio' => 'pages#portfolio'
  get '/transactions' => 'pages#transactions'

  concern :paginatable do
    get 'page/:page', action: :index, on: :collection, as: ''
  end

  concern :paginatable_transactions do
    get 'transactions/:page', action: :transactions, on: :collection, as: ''
  end
  
  resources :stocks, only: [:index], concerns: :paginatable
  resources :pages, only: [:transactions], concerns: :paginatable_transactions
end
