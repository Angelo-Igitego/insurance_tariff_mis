Rails.application.routes.draw do
  resources :medical_acts
  resources :products
  resources :insurance_providers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "insurance_providers#index"
end
