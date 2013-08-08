class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login
  after_action :clear_pending_text, only: :create

  def create
    sign_in(User.find_or_create_from_auth_hash(auth_hash))
    create_email
    authorized_redirect
  end

  protected

  def auth_hash
    request.env["omniauth.auth"][:info].to_h.symbolize_keys
  end

  def sign_in(user)
    session[:user_id] = user.to_param
  end

  def create_email
    @email = Email.create(text: session[:pending_text]) if session[:pending_text]
  end

  def clear_pending_text
    session.delete(:pending_text)
  end

  def authorized_redirect
    if current_user
      redirect_to @email || root_path
    else
      render text: "You are not authorized with Hippo."
    end
  end

end
