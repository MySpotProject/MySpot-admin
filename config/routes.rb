Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :spots
  ActiveAdmin.routes(self)
end
