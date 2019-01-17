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
      redirect_to '/generate'
      return
    end
    redirect_to root_path
  end

  def reg_post
    symbols = 'qwertyuiopasdfghjklzxcvbnm0123456789'
    username = params[:username]
    password = params[:password]
    contains = User.find_by_username(username) == nil
    username_length = username.length > 3
    password_length = password.length > 5
    username_symbols = contains username, symbols
    password_symbols = contains password, symbols

    if !contains
      flash[:error] = 'Пользователь с данным именем существует'
      redirect_to '/reg'
      return
    end

    if !username_length
      flash[:error] = 'Длина логина должна быть больше 3 символов'
      redirect_to '/reg'
      return
    end

    if !password_length
      flash[:error] = 'Длина пароля должна быть больше 5 символов'
      redirect_to '/reg'
      return
    end

    if !username_symbols
      flash[:error] = 'В логине должны использоваться только цифры и латинские символы'
      redirect_to '/reg'
      return
    end

    if !password_symbols
      flash[:error] = 'В пароле должны использоваться только цифры и латинские символы'
      redirect_to '/reg'
      return
    end

    if (contains && username_length && password_length && username_symbols && password_symbols)
      User.create(username: username, password: password)
      session[:name] = username
      redirect_to '/generate'
      return
    end
    redirect_to '/reg'
  end

  def logout
    session[:name] = ''
    redirect_to '/auth'
  end

  def contains(str1, str2)
    flag = true
    str1.split('').each do |s|
      puts s
      if (!str2.include? s)
        flag = false
      end
    end
    return flag
  end
end
