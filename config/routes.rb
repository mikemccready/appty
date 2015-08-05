Rails.application.routes.draw do


  resources :appointments
  resources :providerships
  # root 'users#index'
  root 'sessions#new'

 
  resources :users


  get '/users/:id/appointments' => 'users#appointments', as: :users_appointments
  get '/users/:id/providers' => 'users#providers', as: :users_providers


  get "/auth/:provider/callback" => "sessions#create"
  get 'sessions/show'
  get '/auth/logout' => 'sessions#destroy'

end
