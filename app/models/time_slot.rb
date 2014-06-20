class TimeSlot < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :started_at, presence: true
  validates :ended_at, timeliness: { after: :started_at, allow_nil: true }
  validate :validate_date_range

protected

  def validate_date_range
    if self.crossing_date_ranges_exist?
      self.errors.add(:invalid_date_range, 'Invalid date range')
    end
  end

  def crossing_date_ranges_exist?
    self.class.where.not(id: self.id).where("
      (time_slots.started_at < :started_at AND :started_at < time_slots.ended_at)
      OR (time_slots.started_at < :ended_at AND :ended_at < time_slots.ended_at)
      OR (:started_at < time_slots.started_at AND time_slots.ended_at < :ended_at)
    ".squish, started_at: self.started_at, ended_at: self.ended_at).exists?
  end

end
