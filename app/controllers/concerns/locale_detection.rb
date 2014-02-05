module LocaleDetection
  extend ActiveSupport::Concern

  ACCEPT_LANGUAGE_REGEXP = /([a-z]+(?>-[A-Z0-9]+)?)(?>;q=(\d+\.\d))?,?/

  included do
    before_action :set_locale
    before_action :set_locale_param
  end

protected

  def header_locale
    if request.headers.key?('HTTP_ACCEPT_LANGUAGE')
      request.headers['HTTP_ACCEPT_LANGUAGE']
        .scan(ACCEPT_LANGUAGE_REGEXP)
        .sort_by! { |(_, quality)| -(quality.try(:to_f) || 1.0) }
        .map! { |(locale, _)| locale }
        .find { |locale| I18n.locale_available?(locale) }
    end
  end

  def locale_param
    @locale_param ||= begin
      unless defined?(@locale_param)
        locale = params[:locale].try(:to_s)
        locale if I18n.locale_available?(locale)
      end
    end
  end

  def set_locale
    I18n.locale = self.locale_param || self.header_locale || I18n.default_language
  end

  def set_locale_param
    self.default_url_options.merge!(locale: self.locale_param)
  end

end
