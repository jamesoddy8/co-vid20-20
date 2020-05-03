# frozen_string_literal: true

Rails.application.routes.draw do

  resources :profile_pictures
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
  get 'profiles/all', to: 'profiles#index'
  get 'profiles/:id', controller: 'profiles', action: 'show', as: 'profiles'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
