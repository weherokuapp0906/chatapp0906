Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :posts
  root "articles#index"
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
