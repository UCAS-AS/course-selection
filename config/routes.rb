Rails.application.routes.draw do
  get 'forget_password/create'
  get 'forget_password/destroy'
  get 'email_activation/new'
  get 'email_activation/destroy'
  get 'email_activation/update'
  get 'password_reset/create'
  get 'password_reset/destroy'
  get 'password_reset/update'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :students, only: [:show, :update]
  resources :teachers, only: [:show, :update]
  resources :courses, only: [:index, :show]
  resources :email_activation, only: [:edit]
  resources :password_reset, only: [:edit]

  get '/select_courses', to: 'courses#select_courses'
  get '/selected_courses', to: 'courses#selected_courses'
  get '/credit_count', to: 'courses#credit_count'
  get '/get_select_courses', to: 'courses#get_select_courses'
  get '/get_selected_courses', to: 'courses#get_selected_courses'

  post '/to_select_course', to: 'select_relationships#create'
  delete '/to_un_select_course', to: 'select_relationships#destroy'
  get '/set_degree_course', to: 'select_relationships#update'
  get '/grades', to: 'select_relationships#grades'

  get '/home', to: 'static_pages#home'
  get '/user_profile', to: 'static_pages#user_profile'
  get '/password_setting', to: 'static_pages#update_password'
  get '/email_setting', to: 'static_pages#email_setting'
  get '/forget_password', to: 'static_pages#forget_password'

  patch '/update_password', to: 'password_reset#password_setting'
  patch '/email_activation', to: 'email_activation#create'
  patch '/password_reset', to: 'password_reset#create'
  patch '/to_password_reset', to: 'password_reset#update'
end
