Rails.application.routes.draw do
   devise_for :users,controllers: {sessions: 'sessions'}

   authenticated :user do
     resources :users
    root to: "users#index", as: :authenticated_root
    resources :groupmessages
  end
  unauthenticated   do
      root to:'welcome#index', as: :unauthenticated_root
      resources :users
  end

   resources :conversations do
     resources :messages
   end

end
