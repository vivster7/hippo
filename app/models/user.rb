class User < ActiveRecord::Base
  #TODO: REGEX work
  EMAIL_REGEX = /@#{Regexp.escape(ENV["RESTRICT_DOMAIN"] || "")}\z/

  validates :email, :format => {:with => EMAIL_REGEX }, 
                    :if => Proc.new { ENV["RESTRICT_DOMAIN"].present? }, 
                    :on => :create

  has_and_belongs_to_many :emails

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      where(email: auth_hash[:email]).first_or_create(auth_hash.slice(:first_name, :name))
    end
  end
end

