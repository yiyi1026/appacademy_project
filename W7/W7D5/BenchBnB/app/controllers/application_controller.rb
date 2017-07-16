class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :required_log_in


  def current_user
    user = User.find_by_credentials(username, password)
end
