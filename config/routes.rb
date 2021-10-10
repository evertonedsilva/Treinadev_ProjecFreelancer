Rails.application.routes.draw do
  devise_for :freelancers
  devise_for :employers
  root to: 'home#index'
end
