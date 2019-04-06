# frozen_string_literal: true

class ToolType < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :tools, dependent: :nullify
end
