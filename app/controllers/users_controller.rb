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

  def save_data
    first1 = params[:first1]
    last1 = params[:last1]
    middle1 = params[:middle1]
    serial1 = params[:serial1]
    number1 = params[:number1]
    given1 = params[:given1]
    place1 = params[:place1]
    address1 = params[:address1]

    first2 = params[:first2]
    last2 = params[:last2]
    middle2 = params[:middle2]
    serial2 = params[:serial2]
    number2 = params[:number2]
    given2 = params[:given2]
    place2 = params[:place2]
    address2 = params[:address2]

    given = params[:given]
    ret = params[:return]
    loan_amount = params[:loan_amount]
    year_percent = params[:year_percent]
    delay_payment = params[:delay_payment]
    delay_percent = params[:delay_percent]

    passport1 = Passport.find_by(first_name: first1, last_name: last1, middle_name: middle1, serial: serial1, number: number1);
    passport2 = Passport.find_by(first_name: first2, last_name: last2, middle_name: middle2, serial: serial2, number: number2);

    if (passport1 != nil)
      puts('find')
    else
      puts('not_found')
      passport1 = Passport.create(first_name: first1, last_name: last1, middle_name: middle1, serial: serial1, number: number1, given: given1, address: place1, residential_address: address1)
    end

    if (passport2 != nil)
      puts('find')
    else
      puts('not_found')
      passport2 = Passport.create(first_name: first2, last_name: last2, middle_name: middle2, serial: serial2, number: number2, given: given2, address: place2, residential_address: address2)
    end

    parameter = Parameter.create(date_start: given, date_end: ret, loan_amount: loan_amount, year_percent: year_percent, delay_payment: delay_payment, delay_percent: delay_percent)

    deb = Debenture.create(passport1: passport1, passport2: passport2, parameter: parameter)
    flash[:error] = deb.errors
  end

  def save_table
    given = params[:given]
    ret = params[:return]
    loan_amount = params[:loan_amount]
    year_percent = params[:year_percent]
    delay_payment = params[:delay_payment]
    delay_percent = params[:delay_percent]

    parameter = Parameter.create(date_start: given, date_end: ret, loan_amount: loan_amount, year_percent: year_percent, delay_payment: delay_payment, delay_percent: delay_percent)

    id = parameter.id #Parameter.find_by(date_start: given, date_end: ret, loan_amount: loan_amount, year_percent: year_percent, delay_payment: delay_payment, delay_percent: delay_percent).id

    redirect_to '/table?id=' + id.to_s
  end
end
