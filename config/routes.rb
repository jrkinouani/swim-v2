Rails.application.routes.draw do
  devise_for :admins, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :aquabikes , only: [:index, :show]

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

  root :to => "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
