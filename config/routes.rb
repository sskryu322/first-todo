Rails.application.routes.draw do
  get 'homes', to: 'homes#index'
  root to: 'homes#index'
end
