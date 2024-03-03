Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  get 'users/edit'
  root to: "homes#top"
end