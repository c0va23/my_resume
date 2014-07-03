module TimeZoneDetection
  extend ActiveSupport::Concern

  included do
    around_action :set_time_zone
  end

protected

  def set_time_zone
    if time_zone = request.headers['Time-Zone']
      Time.use_zone(time_zone.to_i) { yield }
    else
      yield
    end
  end

end
