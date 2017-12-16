Rails.application.routes.draw do

  devise_for :users
  get 'attachments/show'

  get 'attachments/create'

  resources :tweeter_users do
  	get :show, :on => :collection
  	get :update_profile, :on => :collection
  	post :update_profile, :on => :collection
  	get :tweet , :on => :collection
  	post :tweet, :on => :collection
  	get :like, :on => :member
  	get :follow, :on => :member
  	get :retweet, :on => :member
  	get :reply, :on => :member
  end

  root :to => 'tweeter_users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
