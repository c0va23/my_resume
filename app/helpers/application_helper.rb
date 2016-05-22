module ApplicationHelper
  DEFAULT_SITE_NAME = 'MyResume'.freeze

  PERIODS = {
    years: 365.days,
    months: 30.days,
    weeks: 7.days
  }.freeze

  def site_name
    ENV['SITE_NAME'] || DEFAULT_SITE_NAME
  end

  def format_period(period)
    # i18n-tasks-use t('application_helper.years')
    # i18n-tasks-use t('application_helper.months')
    # i18n-tasks-use t('application_helper.weeks')
    PERIODS.each_with_object([]) do |(key, multiplier), list|
      count = (period / multiplier).floor
      next if count.zero?
      period -= count * multiplier
      list << t(key, scope: :application_helper, count: count, default: "%{count} #{key}")
    end.join(' ').presence || '&nbsp;'.html_safe
  end

  def format_period_proportion(period, total_period)
    proportion = period / total_period * 100
    format '%.2f %', proportion
  end

  def yandex_metrika_counter_id
    @yandex_metrika_counter_id ||= ENV['YANDEX_METRIKA_COUNTER_ID']
  end

  def yandex_metrika?
    yandex_metrika_counter_id.present? && !Rails.env.development?
  end

  def yandex_verification_code
    ENV['YANDEX_VERIFICATION_CODE']
  end

  def yandex_verification_code?
    yandex_verification_code.present?
  end
end
