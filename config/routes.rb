Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' },
      path_prefix: 'registration'
  root 'welcome#index'
end
