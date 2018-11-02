Rails.application.routes.draw do

  devise_for :admin, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'staticswims/show'

  get 'staticswims/index'

  get 'adultes/show'

  get 'adultes/index'

  get 'reservationgyms/_form'
  get 'reservationgyms/edit'
  get 'reservationgyms/show'
  get 'reservationgyms/index'
  get 'charges/new'
  get 'charges/create'




  resources :aquabikes , only: [:index, :show]
  resources :adultes , only: [:index, :show]
  resources :staticswims , only: [:index, :show]
  resources :aquagyms , only: [:index, :show]
  resources :reservations, only: [:index, :show, :new, :create]
  resources :reservationgyms, only: [:index, :show, :new, :create]

  resources :charges

  get 'pages/aquabike' , to: "pages#aquabike"
  get 'pages/aquaboxing' , to: "pages#aquaboxing"
  get 'pages/aquaparcours' , to: "pages#aquaparcours"
  get '/ecole-natation-petit' , to: "pages#petit"
  get 'pages/fitness' , to: "pages#fitness"
  get 'ecole-natation-moyen', to: "pages#moyen"
  get 'ecole-natation-adulte', to: "pages#adulte"
  get 'pages/bebe' , to: "pages#bebe"
  get 'pages/mention' , to: "pages#mention"
  get 'jardin-aquatique' , to: "pages#jardin"
  get 'pages/staticswims' , to: "pages#staticswims"
  get 'pages/apropos', to: "pages#apropos"

  root :to => "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
