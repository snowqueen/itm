class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
    flash[:alert] = 'There is no user registered yet. The first login will create a admin user with the given name and password!' if User.count == 0
  end

  def create
    if User.count == 0
      u = User.new
      u.name = params[:name]
      u.password = params[:password]
      u.password_confirmation = params[:password]
      u.email = 'admin@itm.hu'
      u.admin = 1
      u.save
    end

    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_root_url
      else
        redirect_to page_url
      end
    else
      redirect_to login_url, :alert => 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to page_url, :notice => 'Logged out'
  end

end
