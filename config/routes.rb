Rails.application.routes.draw do
  devise_for :freelancers
  devise_for :employers
  root to: 'home#index' 
  get 'freelancer_proposals', to: 'freelancers#freelancer_proposals'
 

  resources :lancer_infos, only: [:index, :show, :new, :create, :edit, :update]  
  resources :projects, only: [ :index, :show, :new, :create, :update] do
    get 'employer_profile', on: :collection 
    get 'avaiable', on: :collection
    get 'freelancer_team', on: :collection
    post 'running', on: :collection
    post 'closed', on: :collection

    resources :proposals, only: [ :index, :show, :create] do     
      post 'accept', on: :member
      get 'reject_justify', on: :member
      post 'reject', on: :member
      post 'cancel', on: :member
      end   
  end
  resources :proposals, only: [:show, :destroy, :edit, :update]

end
