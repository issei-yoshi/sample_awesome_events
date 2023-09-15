Rails.application.routes.draw do
  root 'hello#index'
  get 'auth/:provider/callback', to: 'sessions#create'
end
