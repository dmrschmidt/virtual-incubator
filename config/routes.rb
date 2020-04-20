Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :user_profiles, only: [:show, :edit]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
