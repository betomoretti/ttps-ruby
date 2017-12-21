Rails.application.routes.draw do
  resources :tests
  resources :students
  resources :signature_years

  root to: 'signature_years#index'
end
