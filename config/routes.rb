Rails.application.routes.draw do
  get 'teach_relationships/my_courses'
  get 'teach_relationships/submit_grades'
  get 'teach_relationships/notification'
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
  post '/select_courses', to: 'courses#select_courses'
  get '/selected_courses', to: 'courses#selected_courses'
  post '/selected_courses', to: 'courses#selected_courses'
  get '/credit_count', to: 'courses#credit_count'

  post '/to_select_course', to: 'select_relationships#create'
  delete '/to_un_select_course', to: 'select_relationships#destroy'
  post '/set_degree_course', to: 'select_relationships#update'
  get '/grades', to: 'select_relationships#grades'

  get '/my_courses', to: 'teach_relationships#my_courses'
  get '/submit_grades', to: 'teach_relationships#submit_grades'
  get '/notification', to: 'teach_relationships#notification'
  get '/students_of_course', to: 'teach_relationships#students_of_course'
  get '/update_grade', to: 'teach_relationships#update'
  post '/send_course_notification', to: 'teach_relationships#send_course_notification'

  get '/home', to: 'static_pages#home'
  get '/user_profile', to: 'static_pages#user_profile'
  get '/password_setting', to: 'static_pages#update_password'
  get '/email_setting', to: 'static_pages#email_setting'
  get '/forget_password', to: 'static_pages#forget_password'

  post '/update_password', to: 'password_reset#password_setting'
  post '/password_reset', to: 'password_reset#create'
  post '/to_password_reset', to: 'password_reset#update'

  post '/email_activation', to: 'email_activation#create'
end
