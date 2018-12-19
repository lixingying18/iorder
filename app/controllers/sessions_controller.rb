class SessionsController < ApplicationController
  def new
    render 'new'
  end
  def destroy
    log_out
    redirect_to root_url
  end
  
  def create
    user=User.find_by(name:params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = '用户名或者密码错误!' 
      render "new"
    end
  end
  
end
