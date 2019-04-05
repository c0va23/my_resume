# frozen_string_literal: true

class Screenshot < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :description, length: { maximum: 1000 }

  mount_uploader :image, ScreenshotUploader

  belongs_to :project
end
