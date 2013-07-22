class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.to_param
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env["omniauth.auth"][:info].to_h.symbolize_keys
  end
end
