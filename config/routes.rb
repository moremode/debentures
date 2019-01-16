Rails.application.routes.draw do
  get '/generate', to: 'debentures#generate'
  get '/auth', to: 'users#auth'
  get '/reg', to: 'users#reg'
  get '/logout', to: 'users#logout'


  post '/auth', to: 'users#auth_post'
  post '/check-username', to: 'ajax#username_check'
  post '/reg', to: 'users#reg_post'

  root 'users#auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
