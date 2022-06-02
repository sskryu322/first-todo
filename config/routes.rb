Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  get 'homes', to: 'homes#index'
  root to: 'homes#index'
end
