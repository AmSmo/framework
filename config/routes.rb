Rails.application.routes.draw do
  post 'users/favorites', to: "users#add_favorites"
  get 'users/favorites', to: "galleries#my_gallery"
  resources :galleries
  resources :paintings
  resources :users
  get '/floors/:id', to: "galleries#floors"
  get '/search/:keyword', to: "paintings#search"
  post '/login', to: 'users#login'
  get 'auth', to: 'users#auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
