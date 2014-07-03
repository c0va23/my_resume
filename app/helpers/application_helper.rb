module ApplicationHelper
  WEEK = 7

  def format_period(period)
    week_count = (period / WEEK).to_i
    t 'application_helper.weeks', count: week_count, default:'%{count} weeks'
  end

  def format_period_proportion(period, total_period)
    proportion = period / total_period * 100
    '%.2f %' % proportion
  end

  def yandex_metrika_counter_id
    @yandex_metrika_counter_id ||= ENV['YANDEX_METRIKA_COUNTER_ID']
  end

  def yandex_metrika?
    yandex_metrika_counter_id.present? && !Rails.env.development?
  end

end
