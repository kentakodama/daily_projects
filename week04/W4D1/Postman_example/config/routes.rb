Rails.application.routes.draw do


  #get 'silly', to: 'silly#fun'

  resources :superheroes do
    resources :abilities, only: [:index]
  end

  resources :asbilities, only: [:show, :update, :create, :destroy]
end
