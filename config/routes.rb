Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  


  root to: 'pages#index'

  #devise_for :users
  
  devise_for :users, controllers: {
	registrations: 'users/registrations',
	sessions: 'users/sessions'
  }
  
  post 'pages', to: "pages#create"
  post 'leads', to: "pages#createLead"
  post 'donateToMe', to: "pages#donateToMe"
  get 'thankyou', to: "pages#thankyou"
  get 'fileLeads/:id', to: 'pages#download'
  get 'index', to: 'pages#index.html'
  get 'donate', to: 'pages#donate'
  get 'residential', to: 'pages#residential'
  get 'corporate', to: 'pages#corporate'
  get 'quote', to: 'pages#quote'
  get 'geolocalisation/index'
  
  get 'new', to: 'pages#new'
  get 'test', to: 'pages#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
