Rails.application.routes.draw do
  get '/generate', to: 'debentures#generate'
  get '/auth', to: 'users#auth'
  get '/reg', to: 'users#reg'
  get '/logout', to: 'users#logout'
  get '/table', to: 'debentures#generate_table'


  post '/auth', to: 'users#auth_post'
  post '/check-username', to: 'ajax#username_check'
  post '/reg', to: 'users#reg_post'
  post '/save-data', to: 'users#save_data'
  post '/save-table', to: 'users#save_table'

  root 'users#auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
