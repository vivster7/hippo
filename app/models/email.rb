class Email < ActiveRecord::Base
	extend FriendlyId
	friendly_id :image_url, use: :slugged
  before_create :generate_ugly_id, :create_image

  #TODO: change this column name unless we're storing URLs
  def ugly_id
    image_url
  end

  def filename
    ugly_id + ".jpg"
  end

  private

  def generate_ugly_id
    self.image_url = SecureRandom.urlsafe_base64
  end

  def create_image
    #TODO: attach the image to the email model using carrierwave
    kit = IMGKit.new(text, height: 0, width: 564) #0 means calculated from page content
    kit.to_file('app/assets/images/'+ugly_id+'.jpg')
  end
end
