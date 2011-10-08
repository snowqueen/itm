class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize
  before_filter :current_user

  protected

    def current_user
      if session[:user_id]
        @current_user = User.find_by_id(session[:user_id])
        logger.info "Current user: #{@current_user && @current_user.name}"
      end
    end

    def authorize
      user = User.find_by_id(session[:user_id])
      logger.info "Authorize #{user && user.name}"
      if !user
        logger.info "User should login"
        redirect_to login_url, :notice => 'Please log in'
      elsif !user.admin?
        logger.info "#{user.name} is not admin"
        redirect_to page_url
      end
    end
end
