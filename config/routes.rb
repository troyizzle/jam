# frozen_string_literal: true
Rails.application.routes.draw do
  root 'home#index'
  resources :bets
  get '/dashboard', to: 'dashboard#index'
  resource :settings

  resources :profiles, only: %i[show update] do
    resource :avatar, only: %i[update]
    resource :cover_image, only: %i[update]
  end

  namespace :users do
    resources :betting_books
  end

  devise_for :users,
             path: '/',
             path_names: {
               'sign_up': 'register',
               'sign_in': 'login',
             },
             controllers: {
               registrations: 'users/registrations',
               omniauth_callbacks: 'users/omniauth_callbacks',
             }
end
