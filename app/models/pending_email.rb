class PendingEmail
  attr_accessor :email
  include Rails.application.routes.url_helpers

  def initialize(text)
    self.create(text) if text
  end

  def path
    email.present? ? email_path(email) : root_path
  end

  private
  def create(text)
    self.email = Email.create(text: text)
  end

end