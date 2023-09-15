Rails.application.routes.draw do
  resources :events
  root 'hello#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
