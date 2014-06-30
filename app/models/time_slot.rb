class TimeSlot < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :started_at, presence: true
  validates :ended_at, timeliness: { after: :started_at, allow_nil: true }
  validate :validate_date_range

  delegate :name, to: :project, prefix: true

  def period
    self.ended_at_or_now - self.started_at if self.started_at
  end

  def ended_at_or_now
    self.ended_at || Date.current
  end

protected

  def date_range
    (self.started_at..self.ended_at_or_now)
  end

  def validate_date_range
    if self.crossing_date_ranges_exist?
      self.errors.add(:date_range)
    end
  end

  def crossing_date_ranges_exist?
    self.class.where.not(id: self.id).where("
      (time_slots.started_at <= :started_at AND :started_at <= time_slots.ended_at)
      OR (time_slots.started_at <= :ended_at AND :ended_at <= time_slots.ended_at)
      OR (:started_at <= time_slots.started_at AND time_slots.ended_at <= :ended_at)
    ".squish, started_at: self.started_at, ended_at: self.ended_at_or_now).exists?
  end

end
