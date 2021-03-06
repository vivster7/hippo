CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => Secret.AWS_access_key || ENV['AWS_ACCESS_KEY'],        # required
    :aws_secret_access_key  => Secret.AWS_secret_key || ENV['AWS_SECRET_KEY'],        # required
    :region                 => 'us-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'hipaa-hippo'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

  config.root = Rails.root
end