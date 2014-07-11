MyResume::Application.routes.draw do

  root to: 'main#index'

  resources :projects, only: %w[ index show ] do
    resources :time_slots, only: :index
  end
  resources :tools, only: %w[ index show ] do
    resources :time_slots, only: :index
    member do
      get :versions
    end
  end
  resources :time_slots, only: :index

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
    resources :pages, concerns: [ :deletable ]
  end

end
