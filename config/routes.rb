Rails.application.routes.draw do
  resources :bets
  root 'home#index'
  resource :profile
  # TODO: Make this as a resource
  get '/dashboard', to: 'dashboard#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
