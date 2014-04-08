Garageio::Application.routes.draw do

  root to: 'sessions#new'

  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout'  => 'sessions#destroy'

  get 'signup'  => 'users#new'
  post 'signup' => 'users#create'

  get 'users/new' => 'users#new'

  get 'cars'      => 'cars#index'
  get 'cars/new'  => 'cars#new'
  post 'cars'     => 'cars#create'
  get 'cars/:id'  => 'cars#show'
  
end
