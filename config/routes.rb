require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  post 'follow', to: 'users#follow_user', as: 'follow_path'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reviews#index'
  #articles
  get 'articles', to: 'reviews#get_articles', as: 'articles_path'
  get 'articles_api', to: 'reviews#articles_data', as: 'articles_api_path'
  post 'add_review', to: 'reviews#add_review', as: 'add_review_api_path'
  mount Sidekiq::Web, at: '/sidekiq'

end
