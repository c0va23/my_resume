# frozen_string_literal: true

class Contact < ApplicationRecord
  ALLOWED_SCHEMES = %w[
    http
    https
    mailto
    skype
  ].freeze

  validates :label, presence: true
  validates :url, presence: true, uniqueness: true, url: { scheme: ALLOWED_SCHEMES }
end
