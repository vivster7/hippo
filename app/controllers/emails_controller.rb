class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  if basic_auth_exists?
    http_basic_authenticate_with name:     Secret.basic_auth_name || ENV["BASIC_AUTH_NAME"], 
                                 password: Secret.basic_auth_pass || ENV["BASIC_AUTH_PASS"],
                                 only: :authorized_show
  end

  def history
    email = Email.find(params[:id])
    @users = email.users
    render :history
  end

  def authorized_show
    email = Email.find(params[:id])
    email.users << current_user
    send_file "uploads/email/image/#{params[:id]}/#{params[:image]}.jpg", :type => 'image/jpeg', :disposition => 'inline' # if File.exist?("#{params[:image]}")
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

  protected

    def basic_auth_exists?
      if (Secret.basic_auth_name && Secret.basic_auth_pass) || (ENV["BASIC_AUTH_NAME"] && ENV["BASIC_AUTH_PASS"])
    end

end
