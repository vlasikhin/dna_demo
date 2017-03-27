Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' },
      path_prefix: 'registration'

  get   'users/index'
  root  'welcome#index'
end
