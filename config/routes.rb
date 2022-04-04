
Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root "projects#index"
  resources :projects
end

