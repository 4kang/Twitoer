Rails.application.routes.draw do

  resource :tweets, only: [:new, :index, :show, :destroy]

  devise_for :users
  get '/' => 'homes#top'
  get 'homes' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
