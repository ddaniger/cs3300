
Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }
  root "projects#index"
  resources :projects
end

