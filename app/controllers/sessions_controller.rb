class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login
  after_action :clear_pending_emails, only: :create

  def create
    set_session(User.find_or_create_from_auth_hash(auth_hash))
    redirect_to PendingEmail.new(session[:pending_text]).path
  end

  protected

    def clear_pending_emails
      #TODO: Experiement with null session
      session.delete(:pending_text)
    end

    def set_session(user)
      session[:user_id] = user.to_param
    end

    def auth_hash
      request.env["omniauth.auth"][:info].to_h.symbolize_keys
    end

end
