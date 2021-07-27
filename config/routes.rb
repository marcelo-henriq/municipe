Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'static_pages#home'

  resources :citizens, only: [:index, :new, :create, :show, :edit, :update]
end
