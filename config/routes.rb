Rails.application.routes.draw do
  resources :galleries
  resources :paintings
  resources :users
  get '/floors/:id', to: "paintings#floors"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
