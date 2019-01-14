class UsersController < ApplicationController
  def auth
  end

  def reg
  end

  def auth_post
    username = params[:username]
    password = params[:password]
    if User.find_by_username(username) != nil && User.find_by_username(username).password == password
      session[:name] = username
    else
      flash[:error] = 'Пользователь с таким логином и паролем не найден'
    end
    redirect_to root_path
  end

  def logout
    session[:name] = ''
    redirect_to '/auth'
  end
end
