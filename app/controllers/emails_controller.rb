class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  http_basic_authenticate_with name:     Secret.basic_auth_name || ENV["BASIC_AUTH_NAME"], 
                               password: Secret.basic_auth_pass || ENV["BASIC_AUTH_PASS"],
                               only: :authorized_show

  def history
    email = Email.find(params[:id])
    @users = email.users
    render :history
  end

  def authorized_show
    email = Email.find(params[:id])
    email.users << current_user
    send_file "uploads/email/image/#{params[:id]}/#{params[:image]}.jpg", :type => 'image/jpeg', :disposition => 'inline'
  end
  
  def show
    @email = Email.find_by_friendly_id(params[:id].downcase)
    render :show, layout: false
  end

  def create
    @email = Email.create!(text: params[:email][:text])
    render :show, layout: false
  end

  def new
    @email = Email.new
  end

end
