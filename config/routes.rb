Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/components', to: 'pages#components'
  resources :shirts, only: [:show, :index] do
    resources :basket_items, only: [:create]
  end
  resources :basket_items, only: [:destroy]
  get '/basket', to: 'baskets#show'
  get '/about_us', to: 'pages#about_us'
  get '/how_it_works', to: 'pages#how_it_works'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
