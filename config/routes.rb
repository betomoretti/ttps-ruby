Rails.application.routes.draw do
  resources :teachers
  resources :test_notes
  resources :tests
  resources :students
  resources :signature_years do
    member do
      get 'results'
    end
  end

  root to: 'signature_years#index'
end
