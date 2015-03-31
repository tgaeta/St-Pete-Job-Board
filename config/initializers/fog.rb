CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['S3_PRIVATE_KEY'],
    :host                   => 'us-east-1',
    :endpoint               => 'http://s3.amazonaws.com'
  }
  config.fog_directory  = ENV['S3_BUCKET']
end
