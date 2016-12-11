Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products

  resources :orders
  
  resource :cart do
    member do
      post :add_product
      post :remove_product
    end
  end

  root "products#index"

end
