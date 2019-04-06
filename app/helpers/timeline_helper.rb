# frozen_string_literal: true

module TimelineHelper
  def timeline_widget(time_slots_path, filter = false)
    render 'shared/timeline', filter: filter, time_slots_path: time_slots_path
  end
end
