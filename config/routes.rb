Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :sessions, only: [:new, :create, :update, :destroy]

  resources :images,   only: [:index]
  resources :matches,  only: [:index]

  post '/visitors', to: 'visitors#create', as: :new_visitor
  # resources :visitors, only: [:index]

  put '/images', to: 'images#update', as: :like_restaurant
  put '/images', to: 'images#update', as: :dislike_restaurant
  put '/images', to: 'images#update', as: :reject_photo

end
