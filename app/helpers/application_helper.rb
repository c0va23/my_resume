module ApplicationHelper

  def format_period(period)
    { years: 365.days, months: 30.days, weeks: 7.days }.each_with_object([]) do |(key, multiplier), list|
      count = (period / multiplier).floor
      if count > 0
        period = period - count * multiplier
        list << t(key, scope: :application_helper, count: count, default: "%{count} #{key}")
      end
    end.join(' ')
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
