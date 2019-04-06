# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
end
