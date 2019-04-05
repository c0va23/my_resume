# frozen_string_literal: true

module TimeZoneDetection
  extend ActiveSupport::Concern

  included do
    around_action :set_time_zone
  end

  protected

  def set_time_zone
    time_zone = request.headers['Time-Zone']
    return yield if time_zone.blank?

    Time.use_zone(time_zone.to_i) { yield }
  end
end
