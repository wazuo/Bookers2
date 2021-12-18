Rails.application.routes.draw do
  get "about" => "homes#about"
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :edit, :create, :show, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
