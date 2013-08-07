class Email < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ugly_image_id, use: :slugged
  mount_uploader :image, ImageUploader

  after_create :generate_ugly_id, :create_image

  private

    def generate_ugly_id
      self.ugly_image_id = SecureRandom.urlsafe_base64
    end

    def create_image
      add_hippo_protection_mark
      file = Tempfile.new([self.ugly_image_id, '.jpg'], 'tmp', :encoding => 'ascii-8bit')
      file.write(IMGKit.new(self.text, height: 0, quality: 50, width: 564).to_jpg)
      file.flush
      self.image = file
      self.save
      file.unlink
    end

    def add_hippo_protection_mark
      self.text = '<span STYLE="color: #999; font: 8pt courier; font-variant: small-caps;">Content protected by Hippo</span> <br />' + self.text
    end

end
