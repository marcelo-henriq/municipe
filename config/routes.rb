Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :citizens, except: :destroy
end
