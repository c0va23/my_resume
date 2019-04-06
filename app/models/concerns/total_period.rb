# frozen_string_literal: true

module TotalPeriod
  def total_period
    time_slots.reduce(0) do |sum, time_slot|
      sum + time_slot.period
    end
  end
end
