Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :posts
  resources :users, :only => [:show, :update, :edit]
  post '/reviews/create_page', to: 'reviews#create_page'
  post '/reviews/create', to: 'reviews#create'
  get '/cosmeticses/search', to: 'cosmeticses#search'
end
