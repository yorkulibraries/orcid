Rails.application.routes.draw do
  get 'dashboard/index'
  get 'welcome/index'
  root 'welcome#index'
  
  get 'dashboard' => 'dashboard#index'
  
  resources :users
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
