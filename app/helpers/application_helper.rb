module ApplicationHelper
  WEEK = 7

  def format_period(period)
    week_count = (period / WEEK).to_i
    t '.weeks', count: week_count, default:'%{count} weeks'
  end

  def format_period_proportion(period, total_period)
    proportion = period / total_period * 100
    '%.2f %' % proportion
  end

end
