Rails.application.routes.draw do
  resources :poeets do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end
