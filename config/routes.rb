Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticated :user do
    root 'projects#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :projects, except: [:show] do
    resources :tasks, except: [:show, :index]
  end

  resources :tasks, only: [] do
    resources :comments, only: [:new, :create, :destroy]
  end

  get 'tasks/:id/completed', to: 'tasks#completed', as: 'completed_task'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
