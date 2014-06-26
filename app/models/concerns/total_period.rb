module TotalPeriod

  def total_period
    self.time_slots.reduce(0) { |sum, time_slot| sum + time_slot.period }
  end

end
