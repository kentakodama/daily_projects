Rails.application.routes.draw do

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  # get 'users/new'
  #
  # get 'users/create'

  resources :users, only:[:new, :create, :destroy]

  resource :session, only:[:new, :create, :destroy]

  resources :subs do
    resources :posts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
