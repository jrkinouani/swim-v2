Rails.application.routes.draw do

  get 'pages/aquabike' , to: "pages#aquabike"
  get '/ecole-natation-petit' , to: "pages#petit"
  get 'pages/fitness' , to: "pages#fitness"
  get 'ecole-natation-moyen', to: "pages#moyen"
  get 'ecole-natation-adulte', to: "pages#adulte"
  get 'pages/bebe' , to: "pages#bebe"
  get 'pages/mention' , to: "pages#mention"
  get 'jardin-aquatique' , to: "pages#jardin"
  get 'pages/staticswims' , to: "pages#staticswim"

  root :to => "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
