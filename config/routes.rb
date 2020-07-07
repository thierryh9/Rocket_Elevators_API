Rails.application.routes.draw do
  get 'pages/test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
  get 'index', to: 'pages#index'
  get 'residential', to: 'pages#residential'
  get 'corporate', to: 'pages#corporate'
  get 'quote', to: 'pages#quote'
  
end
