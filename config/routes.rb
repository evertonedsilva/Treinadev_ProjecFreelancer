Rails.application.routes.draw do
  devise_for :freelancers
  devise_for :employers
  root to: 'home#index'
  get 'lancer_profile', to: 'freelancers#lancer_profile'  
  resources :lancer_infos, only: [:index, :show, :new, :create, :update]
end
