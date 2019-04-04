class TimeSlot < ApplicationRecord
  belongs_to :project
  has_many :tools, through: :project

  validates :project, presence: true
  validates :started_at, presence: true
  validates :ended_at, date: { after: :started_at, allow_nil: true }
  validate :validate_date_range

  delegate :name, to: :project, prefix: true
  delegate :company_name, to: :project

  class << self
    def total_period
      all.to_a.sum(&:period)
    end
  end

  def period
    (ended_at_or_now - started_at).days
  end

  def ended_at_or_now
    ended_at || Date.current
  end

  protected

  def date_range
    (started_at..ended_at_or_now)
  end

  def validate_date_range
    return unless crossing_date_ranges_exist?

    errors.add(:date_range)
  end

  def crossing_date_ranges_exist?
    self.class.where.not(id: id).where("
      (time_slots.started_at <= :started_at AND :started_at <= time_slots.ended_at)
      OR (time_slots.started_at <= :ended_at AND :ended_at <= time_slots.ended_at)
      OR (:started_at <= time_slots.started_at AND time_slots.ended_at <= :ended_at)
    ".squish, started_at: started_at, ended_at: ended_at_or_now).exists?
  end
end
