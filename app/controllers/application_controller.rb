class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :require_login

  protected

  def auth_path
    return "/auth/developer" if Rails.env.development? && !google_auth_enabled?
    "/auth/gplus"
  end

  def google_auth_enabled?
    Secret.to_h.has_key?(:google_key)
  end

  def require_login
    unless current_user
      session[:pending_text] ||= email_params[:text]
      redirect_to auth_path
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def email_params
    params.require(:email).permit(:text) if params[:email]
  end

end
