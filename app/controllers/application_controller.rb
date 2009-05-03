# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include ExceptionNotifiable  # Exception notification plugin
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def authenticate_admin
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == APP_CONFIG[:admin_password]
    end
  end
end
