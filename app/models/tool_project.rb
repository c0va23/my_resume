# frozen_string_literal: true

class ToolProject < ApplicationRecord
  belongs_to :project
  belongs_to :tool

  validates :project, presence: true
  validates :tool, presence: true
  validates :tool_id, uniqueness: { scope: :project_id }

  delegate :name, to: :tool, prefix: true
  delegate :total_period, to: :project, prefix: true

  scope :with_tools, -> { preload(:tool) }
end
