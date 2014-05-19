class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :set_user_language
  private
  
  

def set_user_language
if current_user
  I18n.locale = current_user.language 
end
end

  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
