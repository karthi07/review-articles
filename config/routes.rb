Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  get 'users/', to: 'users#index'
  post 'follow', to: 'users#follow_user', as: 'follow_path'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reviews#index'
  #articles
  get 'articles', to: 'reviews#get_articles', as: 'articles_path'

end
