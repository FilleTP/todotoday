Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, only: [:show], param: :nickname
  resources :task_lists, only: [:index, :create, :show] do
    resources :tasks, only: [:create, :update, :destroy]
    resources :invitations, only: [:create] do
      member do
        get 'accept/:token', action: 'accept', as: 'accept'
        get 'decline/:token', action: 'decline', as: 'decline'
      end
    end
  end
end
