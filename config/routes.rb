Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 registrations: 'registrations',
                 omniauth_callbacks: 'omniauth_callbacks'
             },
             path_prefix: 'registration'

  get   'users/index'
  root  'welcome#index'

  resources :users do
    member do
      post :confirm_verification
      post :decline_verification
      post :ban_user
      post :cancel_ban_user
    end
  end
end
