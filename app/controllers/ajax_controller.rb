class AjaxController < ApplicationController

  layout false
  def username_check
    user = User.find_by_username(params[:username]);
    text = 'false'
    if user == nil
      text = 'true'
    end
    if (params[:username].length < 4)
      text = ''
    end
    ajax(text)
    render 'ajax'
  end

  def ajax (text)
    @text = text
    puts text
  end
end
