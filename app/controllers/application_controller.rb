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
    puts registered?(params)
    unless registered?(params)
      #params will be sent before login if they are sent directly from the extension.
      if params.has_key? :email
        if params[:email].has_key? :text
          if params[:email].has_key? :account
            render inline: "<%='http://localhost:3000/auth/gplus'%>"
          end
        end
      #no params sent; accessing directly via web service
      else
        redirect_to auth_path unless current_user
      end
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def registered?(params)
    if params.has_key? :email
      if params[:email].has_key? :account
        return User.where(email: params[:email][:account]).count == 1
      end
    end
    return false
  end

end
