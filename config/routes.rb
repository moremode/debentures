Rails.application.routes.draw do
  get '/auth', to: 'users#auth'
  get '/reg', to: 'users#reg'
  get '/logout', to: 'users#logout'

  post '/auth', to: 'users#auth_post'

  root 'users#auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
