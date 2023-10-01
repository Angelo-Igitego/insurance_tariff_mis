Rails.application.routes.draw do

  namespace :api do
    namespace :v1, path: '/' do
        resources :drugs
        resources :consumables
        resources :lab_tests
        resources :medical_acts
        resources :products
        resources :insurance_providers
    end
  end
end
