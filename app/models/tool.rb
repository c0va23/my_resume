# frozen_string_literal: true

class Tool < ApplicationRecord
  include TotalPeriod

  validates :name, presence: true, uniqueness: true

  belongs_to :tool_type

  has_many :tool_projects, dependent: :destroy
  has_many :projects, through: :tool_projects
  has_many :time_slots, through: :projects

  delegate :name, to: :tool_type, prefix: true, allow_nil: true

  def self.available_for(tool_project)
    used_tools = tool_project.project.tools.where.not(id: tool_project.tool_id)
    where.not(id: used_tools.select(Tool.arel_table[:id]))
  end

  def versions
    tool_projects.includes(project: [:time_slots]).group_by(&:version).map do |(version, tool_projects)|
      period = tool_projects.map(&:project_total_period).inject(0, :+)
      Version.new(version, period)
    end
  end
end
