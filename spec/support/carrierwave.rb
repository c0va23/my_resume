CarrierWave.configure do |config|
  config.enable_processing = false
  config.store_dir = Rails.root.join('tmp/spec_uplaods')
end
