Rails.application.routes.draw do
  devise_for :users
  get 'homes', to: 'homes#index'
  root to: 'homes#index'
end
