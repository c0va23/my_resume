class Screenshot < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :token, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  mount_uploader :token, ScreenshotUploader
end
