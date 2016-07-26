Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :reviews, only: :create do
    put :like
    put :dislike
  end
  resources :places, only: [:index, :show, :new, :create]
  resources :complains, only: :create

  get '/' => 'map#index', as: 'map'

  root 'map#index'

  #resources :countries, only: [:index] do 
  #  resources :regions, only: [:index] do
  #    resources :cities, only: [:index, :show]
  #  end
  #end
end
