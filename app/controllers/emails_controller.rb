class EmailsController < ApplicationController
	def show
		@email = Email.friendly.find(params[:id].downcase)
		render layout: false
	end

	def create
		ugly_id = SecureRandom.urlsafe_base64
		@email = Email.new(text: params[:email][:text], image_url: ugly_id)

		if @email.save!
			html = @email.text
			kit = IMGKit.new(html, height: 0, width: 564) #0 means calculated from page content
			file = kit.to_file('app/assets/images/'+ugly_id+'.jpg')
			render inline: "<%=image_tag('http://privacy.omadahealth.com:3000/assets/'+@email.image_url+'.jpg')%>"
		else
			render :new
		end
	end

	def new
		@email = Email.new
	end

end
