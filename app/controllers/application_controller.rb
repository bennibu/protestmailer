# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include ExceptionNotifiable  # Exception notification plugin
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Use this method to call a rake task,,
  # e.g. to deliver mails after there are created.
  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == APP_CONFIG[:admin_password]
    end
  end
end
