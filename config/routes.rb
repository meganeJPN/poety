Rails.application.routes.draw do
  resources :poeets do
    collection do
      post :confirm
    end
  end
end
