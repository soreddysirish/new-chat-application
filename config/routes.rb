Rails.application.routes.draw do
  devise_for :users

 resources :users
   authenticated :user do
     root 'users#index'
  end
   resources :conversations do
     resources :messages
   end
end
