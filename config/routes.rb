Rails.application.routes.draw do
  get '/poeets', to: 'poeets#index'
  resources :poeets
end
