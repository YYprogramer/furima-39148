Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
