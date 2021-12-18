Rails.application.routes.draw do
  get 'users/show'
  get "about" => "homes#about"
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :edit, :create, :show, :update, :destroy]
end
