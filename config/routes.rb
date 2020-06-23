Rails.application.routes.draw do
  get 'sessions/new'
  root "poeets#index"
  resources :poeets, only: [:index, :new, :create, :edit, :update,:destroy]  do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
  resources :users, only:[:new,:create,:show]
  resources :sessions, only: [:new, :create, :destroy]
end
