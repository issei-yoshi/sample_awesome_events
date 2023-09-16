Rails.application.routes.draw do
  root 'hello#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :retirements

  resources :events do
    resources :tickets
  end
end
