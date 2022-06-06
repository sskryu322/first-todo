Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  get 'homes', to: 'homes#index'
  root to: 'homes#index'
  resources :mylists, only: [:index, :create, :edit, :show, :update, :destroy]
  resources :users, only: :show
  resources :rooms, only: [:index, :create, :edit, :show, :update, :destroy]
end
