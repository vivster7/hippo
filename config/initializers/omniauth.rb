Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if Secret.respond_to?(:google_key)
    provider :gplus, Secret.google_key, Secret.google_secret, scope: 'userinfo.email, userinfo.profile'
  else
    provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'userinfo.email, userinfo.profile'
  end
end
OmniAuth.config.logger = Rails.logger

