Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do
  namespace :v1 do
    resources :users, only:[:index, :create]
    resources :medications, only: [:index, :show, :destroy]
    resources :disease_states
    resources :notes,  only: [:index, :show, :create, :update, :destroy]

    post '/login', to: 'auths#create'
    
  end
end
end
