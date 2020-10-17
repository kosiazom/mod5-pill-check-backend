Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do
  namespace :v1 do
    resources :users, only:[:index, :show, :create] do
      resources :notes
      resources :medications
      resources :disease_states
    end
    resources :medications, only: [:index, :show, :destroy]
    resources :disease_states
    resources :notes,  only: [:index, :show, :create, :update, :destroy]
    resources :user_medications

    post '/login', to: 'auths#create'
    
  end
end
end
