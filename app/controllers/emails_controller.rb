class EmailsController < ApplicationController
	def create
		email = Email.create(text: params[:email][:text])
		email.save!
		render json: email.to_json(except: [:id, :created_at, :updated_at])
	end

	def index
		@email = Email.new
	end
end
