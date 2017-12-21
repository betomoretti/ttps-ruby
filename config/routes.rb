Rails.application.routes.draw do
  resources :signature_years

  root to: 'signature_years#index'
end
