Rails.application.routes.draw do

  resources :jobs do
    resources :apply_jobs
  end
  #company

  resources :companies do
    resources :reviews
  end
  #users
  devise_for :users

  #static pages routes
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :user_info, only: [:new, :create]
  
  match '*path', to: 'static_pages#home', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
