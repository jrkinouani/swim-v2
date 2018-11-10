Rails.application.routes.draw do

  get 'polos/index'

  get 'polos/show'

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

  get 'ecoles/index'
  get 'ecoles/show'

  get 'reservationstatics/_form'
  get 'reservationstatics/new'
  get 'reservationstatics/show'
  get 'reservationstatics/index'

  get 'reservationcours/_form'
  get 'reservationcours/new'
  get 'reservationcours/show'
  get 'reservationcours/index'

  get 'reservationgyms/_form'
  get 'reservationgyms/edit'
  get 'reservationgyms/show'
  get 'reservationgyms/index'

  get 'charges/new'
  get 'charges/create'

  get 'reservationpalmes/_form'
  get 'rreservationpalmes/index'
  get 'reservationpalmes/show'
  get 'reservationpalmes/new'

  get 'reservationads/_form'
  get 'reservationads/edit'
  get 'reservationads/show'
  get 'reservationads/index'

  get 'reservationboxings/_form'
  get 'reservationboxings/index'
  get 'reservationboxings/show'
  get 'reservationboxings/new'

  get 'reservationjards/_form'
  get 'reservationjards/index'
  get 'reservationjards/show'
  get 'reservationjards/new'

  resources :charges
  resources :aquaboxings , only: [:index, :show]
  resources :jardins , only: [:index, :show]
  resources :nagepetits , only: [:index, :show]
  resources :aquabikes , only: [:index, :show]
  resources :aquaparcours , only: [:index, :show]
  resources :palmes , only: [:index, :show]
  resources :adultes , only: [:index, :show]
  resources :staticswims , only: [:index, :show]
  resources :aquagyms , only: [:index, :show]
  resources :ecoles , only: [:index, :show]
  resources :polos , only: [:index, :show]
  resources :reservations, only: [:index, :show, :new, :create]
  resources :reservationgyms, only: [:index, :show, :new, :create]
  resources :reservationads, only: [:index, :show, :new, :create]
  resources :reservationpalmes, only: [:index, :show, :new, :create]
  resources :reservationstatics, only: [:index, :show, :new, :create]
  resources :reservationcours, only: [:index, :show, :new, :create]
  resources :reservationboxings, only: [:index, :show, :new, :create]
  resources :reservationpetits, only: [:index, :show, :new, :create]
  resources :reservationjards, only: [:index, :show, :new, :create]
  resources :reservationecoles, only: [:index, :show, :new, :create]
  resources :reservationpolos, only: [:index, :show, :new, :create]

  get 'pages/mention' , to: "pages#mention"
  get 'pages/apropos', to: "pages#apropos"

  root :to => "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
