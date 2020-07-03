Rails.application.routes.draw do

get 'displays', to: 'displays#index'
  
  get 'displays/my_location', to: 'displays#my_location', as: 'my_location'
  
  get 'displays/others_location', to: 'displays#others_location', as: 'others_location'
  resources :locations
  resources :statuses
  devise_for :users
  root 'displays#index'
end
