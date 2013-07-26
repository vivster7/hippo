class Email < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ugly_image_id, use: :slugged

  before_create :generate_ugly_id, :create_image

  def filename
    ugly_image_id + '.jpg'
  end

  private

    def generate_ugly_id
      self.ugly_image_id = SecureRandom.urlsafe_base64
    end

    def create_image
      #TODO: User carrierwave to connect db with filesystem image.
      kit = IMGKit.new(text, height: 0, width: 564)
      kit.to_file('app/assets/images/'+filename)
    end

end
