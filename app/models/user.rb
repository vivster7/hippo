class User < ActiveRecord::Base
  EMAIL_REGEX = /@#{Regexp.escape(ENV["RESTRICT_DOMAIN"] || "")}\z/

  validates :email, :format => {:with => EMAIL_REGEX }, 
                    :if => Proc.new { ENV["RESTRICT_DOMAIN"].present? }, 
                    :on => :create

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      where(email: auth_hash[:email]).first_or_create(auth_hash.slice(:first_name, :name))
    end
  end
end

