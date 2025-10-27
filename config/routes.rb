Rails.application.routes.draw do
  get "carts/show"
  get "cartitems/create"
  get "cartitems/destroy"
  get "products/index"
  get "products/new"
  get "products/create"
  get "products/destroy"
  get "top/main"
  
  root "top#main"
  get "top/main"

  resources :products
  resources :cartitems do
    member do
      patch :update_quantity
    end
  end
  resource :carts

  get "up" => "rails/health#show", as: :rails_health_check
end
