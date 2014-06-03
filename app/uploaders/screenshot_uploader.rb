# encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base

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

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def full_filename(filename)
    (self.version_name.try(:to_s) || 'original') + File.extname(original_filename)
  end

end
