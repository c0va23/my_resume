class Tool < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :tool_projects, dependent: :destroy
  has_many :projects, through: :tool_projects

  scope :available_for, -> project { where.not(id: project.tools.select(Tool.arel_table[:id])) }
end
