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
      get 'tests'
    end
  end
  namespace :tests do
    get '/:test_id/test_notes/new', to: 'test_notes#new', as: :test_note_new
    post '/:test_id/test_notes', to: 'test_notes#create', as: :test_note
  end
end
