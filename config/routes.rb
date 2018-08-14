Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }
  root 'top#index'
  resources :users, :only => [:show, :update, :edit]
  post '/reviews/create_page', to: 'reviews#create_page'
  post '/reviews/create', to: 'reviews#create'
  get '/cosmeticses/search', to: 'cosmeticses#search'
end
