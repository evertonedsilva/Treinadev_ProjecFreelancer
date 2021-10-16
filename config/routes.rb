Rails.application.routes.draw do
  devise_for :freelancers
  devise_for :employers
  root to: 'home#index' 
  resources :lancer_infos, only: [:index, :show, :new, :create, :update]
  resources :freelancers, only: [ :show ]
  resources :projects, only: [ :index, :show, :new] do
    get 'my_profile', on: :collection 
  end

end
