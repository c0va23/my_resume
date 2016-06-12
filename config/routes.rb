MyResume::Application.routes.draw do
  root to: 'main#index'

  resources :projects, only: %i( index show ) do
    resources :time_slots, only: :index
  end
  resources :tools, only: %i( index show ) do
    resources :time_slots, only: :index
    member do
      get :versions
    end
  end
  resources :time_slots, only: :index
  resources :pages, only: %w( index show )
  resources :companies, only: %i(index)

  get '/admin' => redirect('/admin/projects')
  namespace :admin do
    concern :deletable do
      get :delete, on: :member
    end
    resources :projects, concerns: %i( deletable ) do
      resources :screenshots, concerns: %i( deletable )
      resources :tool_projects, concerns: %i( deletable )
      resources :time_slots, concerns: %i( deletable )
    end
    resources :tools, concerns: %i( deletable )
    resources :pages, concerns: %i( deletable )
    resources :tool_types, concerns: %i( deletable )
    resources :contacts, concerns: %i( deletable )
    resources :companies, concerns: %i( deletable )
  end
end
