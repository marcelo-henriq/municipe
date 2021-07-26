CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['STORAGE_ACCESS_KEY'],
    aws_secret_access_key: ENV['STORAGE_SECRET_KEY'],
    region: 'fra1',
    endpoint: 'https://fra1.digitaloceanspaces.com'
  }
  config.fog_directory  = 'om30citizen-bucket'
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end
