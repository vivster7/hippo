class EmailsWorker
	include Sidekiq::Worker

	def perform(email_id, ugly_id)
		email = Email.find(email_id)
		html = email.text
		kit = IMGKit.new(html)
		file = kit.to_file('app/assets/images/'+ugly_id+'.jpg')
	end

end
