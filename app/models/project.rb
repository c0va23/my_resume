class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :screenshots, dependent: :destroy
  has_many :tool_projects, dependent: :destroy
  has_many :tools, through: :tool_projects
  has_many :time_slots, dependent: :destroy

  def total_period
    self.time_slots.reduce(0) { |sum, time_slot| sum + time_slot.period }
  end
end
