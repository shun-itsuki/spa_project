Rails.application.routes.draw do

  root "users/articles#index"

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
    resources :articles
    resources :mypages, only:[:show]
    resources :explanation, only:[:index]
  end

  namespace :admins do
    resources :mypages, only:[:show]
  end
end
