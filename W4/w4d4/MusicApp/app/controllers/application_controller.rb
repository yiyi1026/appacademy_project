class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user_id
    current_user ? current_user.id : nil
  end
  # def logout
  #   current_user.reset_session_token!
  #   session[:session_token] = nil
  # end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
