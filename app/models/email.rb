class Email < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ugly_image_id, use: :slugged
  mount_uploader :image, ImageUploader

  after_create :generate_ugly_id, :create_image

  def filename
    ugly_image_id + '.jpg'
  end

  private

    def generate_ugly_id
      self.ugly_image_id = SecureRandom.urlsafe_base64
    end

    def create_image
      file = Tempfile.new([self.ugly_image_id, '.jpg'], 'tmp', :encoding => 'ascii-8bit')
      file.write(IMGKit.new(self.text, height: 0, quality: 50, width: 564).to_jpg)
      file.flush
      self.image = file
      self.save
      file.unlink
      #TODO: User carrierwave to connect db with filesystem image.
      # kit = IMGKit.new(text, height: 0, width: 564)
      # self.image = kit
      # kit.to_file('app/assets/images/'+filename)
    end

end
