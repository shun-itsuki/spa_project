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
    resources :articles do
      resource :comments, only:[:show, :create, :destroy]
      resource :likes, only:[:create, :destroy]
    end
    resources :mypages, only:[:show, :edit, :update, :destroy]
    resources :mypage_like, only:[:show]
    resources :search, only:[:show,]
    get "/search_around", to: "search#search"
    resources :explanation, only:[:index]
  end

  namespace :admins do
    resources :mypages, only:[:show]
    resources :users, except:[:new, :create]
    resources :articles, only: [:index, :show, :destroy]
  end
end
