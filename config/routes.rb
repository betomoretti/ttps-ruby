Rails.application.routes.draw do
  resources :test_notes
  resources :tests
  resources :students
  resources :signature_years

  root to: 'signature_years#index'
end
