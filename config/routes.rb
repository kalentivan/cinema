Rails.application.routes.draw do
  root to: 'films#index'
  
  get '/comments/:id', to: 'comments#destroy'

  resources :comments, only: %i[new create edit update destroy]
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
  resources :films, only: %i[new create show index]
  resources :contacts, only: %i[index]
  resources :admin, only: %i[index]
end
