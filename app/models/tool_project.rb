class ToolProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :tool

  validates :project, presence: true
  validates :tool, presence: true

  delegate :name, to: :tool, prefix: true
end
