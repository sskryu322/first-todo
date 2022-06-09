Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  get 'homes', to: 'homes#index'
  
  root to: 'homes#index'
  resources :mylists, only: [:index, :create, :edit, :show, :update, :destroy]
  resources :users, only: :show
  resources :rooms, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :grouplists, only: [:index, :create, :edit, :show, :update, :destroy]
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
