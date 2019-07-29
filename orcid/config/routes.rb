Rails.application.routes.draw do
  get 'dashboard/index'
  get 'welcome/index'
  root 'welcome#index'
  
  get 'dashboard' => 'dashboard#index'
  get 'authorize' => 'welcome#authorize'
  
  resources :users
  
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
end
