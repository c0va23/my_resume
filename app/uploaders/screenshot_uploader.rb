# encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base
  TOKEN_LENGTH = 8

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  version :thumb200 do
    process :resize_to_fit => [ 200, 200 ]
  end

  before :cache, :generate_secure_token

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}#{extension}"
  end

private

  def generate_secure_token(file)
    new_secure_token = SecureRandom.hex(TOKEN_LENGTH)
    self.model.send("#{mounted_as}=", new_secure_token)
  end

  def secure_token
    self.model.send(mounted_as)
  end

  def version_prefix
    self.version_name.try(:to_s) || 'original'
  end

  def extension
    File.extname(original_filename)
  end

end
