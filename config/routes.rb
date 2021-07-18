Rails.application.routes.draw do

  root :to => 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users

  #indexからdestroyまでの7つのアクション(RESTfulなURL)
  resources :books

  resources :users, only: [:show, :index]
  resources :user_image, only: [:edit, :update,:destroy]

end
