Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'homes#index'
  #  resources :homes do
  #   resources :orders, only: [:index, :create]
  #  end
end