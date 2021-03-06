class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper# module will be accessible in each controller

  private
  
  def logged_in_user
  unless logged_in?
    store_location
    flash[:danger]='please log in.'
    redirect_to login_url
  end  
end
end
