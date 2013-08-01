class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  http_basic_authenticate_with :name => "gollum", :password => "smeagol", only: :authorized_show


  def authorized_show
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
