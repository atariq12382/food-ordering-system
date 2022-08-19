Rails.application.routes.draw do
  get 'employees/solo/:id', to: 'employees#solo', as: :employee_solo
  post 'deal_menu_items/associate', to: 'deal_menu_items#associate', as: :deal_menu_item_associate
  get 'deal_menu_items/detail', to: 'deal_menu_items#detail', as: :deal_menu_item_detail
  get 'employees/index'
  get 'welcome/index'
  root 'managers#dashboard'
  resources :deals
  resources :deal_menu_items
  resources :categories
  resources :menu_items
  resources :employees, only:[:index, :create, :destroy, :edit, :update, :new, :solo]
  devise_for :employees, path: 'employees'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
