Rails.application.routes.draw do
  resources :questions, only: [:show, :create, :new]
  resources :answers, only: [:create]
  resources :user_profiles, only: [:show, :edit, :new, :update]

  resources :welcome, only: [:index]

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
