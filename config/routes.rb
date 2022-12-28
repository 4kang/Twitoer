Rails.application.routes.draw do
  devise_for :users
  get '/' => 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'

  resources :tweets, only: [:new, :create, :show, :destroy]
  get 'home' => 'tweets#index'

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
