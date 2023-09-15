Rails.application.routes.draw do
  root 'hello#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events
end
