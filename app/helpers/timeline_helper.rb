module TimelineHelper

  def timeline_widget(time_slots_path)
    content_tag :div, class: 'js-timeline', data: { time_slots_path: time_slots_path } do
      concat tag :div, class: 'js-timeline-container'
    end
  end

end
