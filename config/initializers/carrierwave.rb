if ENV['AWS_ACCESS_KEY'].present?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['AWS_ACCESS_KEY'],
        aws_secret_access_key: ENV['AWS_SECRET'],
        region:                ENV['AWS_REGION'],
    }
    config.fog_directory  = ENV['AWS_S3_BUCKET']
    config.fog_public     = true

    config.storage = Rails.env.development? ? :file : :fog
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
