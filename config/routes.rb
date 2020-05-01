# frozen_string_literal: true

Rails.application.routes.draw do
  resources :messages
  resources :conversations do
    resources :messages
  end
  
  resources :comments, only: [:new, :create]
  resources :videos do
    resources :likes
    member do
      put "like" => "videos#vote"
    end
  end

  get 'home/index'
  get '/search', to: 'videos#search', as: 'search_page'
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
