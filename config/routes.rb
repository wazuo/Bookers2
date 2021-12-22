Rails.application.routes.draw do
  get "home/about" => "homes#about", as:'about'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :edit, :create, :show, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index, :create]
end
