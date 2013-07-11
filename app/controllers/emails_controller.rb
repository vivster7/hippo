class EmailsController < ApplicationController
	def show
		@email = Email.find(params[:id])
	end

	def create
		email = Email.create(text: params[:email][:text])
		email.save!

		name = SecureRandom.urlsafe_base64
		html = email.text
		kit = IMGKit.new(html)
		file = kit.to_file('app/assets/images/'+name+'.jpg')
		render inline: "<%=link_to 'Clikc here to see your email or load image below', email_path(#{email.id})%><%=image_tag('#{name}.jpg')%>"
	end

	def index
		@email = Email.new
	end
end
