Rails.application.routes.draw do
  devise_for :teachers, skip: [:registrations]

  authenticated :teacher do
    root to: 'signature_years#index', as: :authenticated_root
  end
  root to: redirect('/teachers/sign_in')

  resources :teachers
  resources :test_notes
  resources :tests
  resources :students
  resources :signature_years do
    member do
      get 'results'
      get 'students'
    end
  end

end
