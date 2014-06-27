module ApplicationHelper

  def format_period(period)
    t '.days', count: period.to_i, default:'%{count} days'
  end

  def format_period_proportion(period, total_period)
    proportion = period / total_period * 100
    '%.2f %' % proportion
  end

end
