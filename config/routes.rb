Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  get 'users/', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reviews#index'
end
