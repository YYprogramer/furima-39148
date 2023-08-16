Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }
  root to: 'items#index'

  resources :items do
      resources :orders, omly: [:index, :create]
  end
end
