Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  post '/reviews/create_page', to: 'reviews#create_page'
  post '/reviews/create', to: 'reviews#create'
  get '/cosmeticses/search', to: 'cosmeticses#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
