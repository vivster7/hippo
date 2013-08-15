class Email < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ugly_image_id, use: :slugged
  mount_uploader :image, ImageUploader

  #This has to be an after_create because self.save is called
  #in create_image. Self.save must be called in create_image
  #to properly save the slug.
  after_create :generate_ugly_id, :create_image

  has_and_belongs_to_many :users

  private

    def generate_ugly_id
      self.ugly_image_id = SecureRandom.urlsafe_base64
    end

    def create_image
      file = Tempfile.new([self.ugly_image_id, '.jpg'], 'tmp', :encoding => 'ascii-8bit')
      file.write(IMGKit.new(add_hippo_protection_mark+self.text, height: 0, quality: 50, width: 564).to_jpg)
      file.flush
      self.image = file
      self.save
      file.unlink
    end

    def add_hippo_protection_mark
      '<span STYLE="color: #999; font: 8pt courier; font-variant: small-caps;">Content protected by Hippo</span> <br />'
    end

end
