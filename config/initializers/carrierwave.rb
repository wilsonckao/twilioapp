CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'XXXXXXXXXXXXXXXXXXXX',                        # required
    :aws_secret_access_key  => 'YYYYYYYYYYYYYYYYYYYYY',                        # required
  }
  config.fog_directory  = 'yelpdemo'                     # required
end
