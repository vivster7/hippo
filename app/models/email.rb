class Email < ActiveRecord::Base
	extend FriendlyId
	friendly_id :image_url, use: :slugged
end
