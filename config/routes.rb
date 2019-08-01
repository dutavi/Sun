# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :terms
    resources :phrases_terms
    resources :phrases
  end

  root to: "visitors#index"
  devise_for :users
  resources :users
  resources :phrases do
    resources :comments, only: [:create, :destroy]
  end
end
