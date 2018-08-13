Rails.application.routes.draw do
  devise_for :users
  resources :top
  resources :review
  get '/cosmeticses/search', to: 'cosmeticses#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
