Rails.application.routes.draw do

  resources :abouts
  resources :buys
  resources :buys
  resources :milks do
    resources :reviews
  end
  
  root 'pages#info'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations" }
  
end
  