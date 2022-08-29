Rails.application.routes.draw do
  resources :credits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'credits#index'
  devise_for :users
end
