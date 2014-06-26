module ApplicationHelper

  def format_period(period)
    t '.days', count: period.to_i, default:'%{count} days'
  end

end
