Rails.application.routes.draw do
  resources :appointments
  resources :providerships
  # root 'users#index'
  root 'sessions#new'
  resources :users


  get "/auth/:provider/callback" => "sessions#create"
  get 'sessions/show'
  get '/auth/logout' => 'sessions#destroy'

end
