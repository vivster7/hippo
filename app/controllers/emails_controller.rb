class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
	def show
      #TODO: double check that friendly doesn't allow finding by db ID
      @email = Email.friendly.find(params[:id].downcase)
      render :show, layout: false
	end

	def create
      if @email = Email.create(email_params)
        render :show, layout: false
      else
        render :new
      end
	end

	def new
      @email = Email.new
	end

end
