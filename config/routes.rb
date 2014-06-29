MyResume::Application.routes.draw do

  root to: redirect('/projects')

  resources :projects, only: %w[ index show ] do
    collection do
      get :timeline
    end
  end
  resources :tools, only: %w[ index show ] do
    member do
      get :versions
    end
  end

  get '/admin' => redirect('/admin/projects')
  namespace :admin do
    concern :deletable do
      get :delete, on: :member
    end
    resources :projects, concerns: [ :deletable ] do
      resources :screenshots, concerns: [ :deletable ]
      resources :tool_projects, concerns: [ :deletable ]
      resources :time_slots, concerns: [ :deletable ]
    end
    resources :tools, concerns: [ :deletable ]
  end

end
