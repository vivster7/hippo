class EmailsController < ApplicationController
	def show
		@email = Email.friendly.find(params[:id].downcase)
	end

	def create
		name = SecureRandom.urlsafe_base64
		email = Email.create!(text: params[:email][:text], image_url: name)

		html = email.text
		kit = IMGKit.new(html)
		file = kit.to_file('app/assets/images/'+name+'.jpg')
		render inline: "<%=link_to 'Click here to see your email or load image below', 'http://localhost:3000/emails/#{email.image_url}'%><%=image_tag('#{name}.jpg')%>"
	end

	def index
		@email = Email.new
	end
end
