class TimeSlot < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :started_at, presence: true
  validates :ended_at, timeliness: { after: :started_at, allow_nil: true }
end
