Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  # get 'static_pages/home'
  # get 'static_pages/about'
  # get 'static_pages/services'
  # get 'static_pages/menu'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/about', to: 'static_pages#about'
  get '/menu', to: 'static_pages#menu'
  get '/home', to: 'static_pages#home'
  get '/service', to: 'static_pages#service'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  
end
