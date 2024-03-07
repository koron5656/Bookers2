Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  #get 'users/show'
  #get 'users/edit'
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit, :update, :index]
end