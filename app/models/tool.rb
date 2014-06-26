class Tool < ActiveRecord::Base
  include TotalPeriod

  validates :name, presence: true, uniqueness: true

  has_many :tool_projects, dependent: :destroy
  has_many :projects, through: :tool_projects
  has_many :time_slots, through: :projects

  def self.available_for(tool_project)
    used_tools = tool_project.project.tools.where.not(id: tool_project.tool_id)
    self.where.not(id: used_tools.select(Tool.arel_table[:id]))
  end
end
