class EmailsController < ApplicationController
	def show
		@email = Email.friendly.find(params[:id].downcase)
	end

	def create
		ugly_id = SecureRandom.urlsafe_base64
		@email = Email.new(text: params[:email][:text], image_url: ugly_id)

		if @email.save!
			EmailsWorker.perform_async(@email.id, ugly_id)	
			redirect_to email_path(@email)
		else
			render :new
		end
	end

	def new
		@email = Email.new
	end

end
