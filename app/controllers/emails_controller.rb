class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
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
