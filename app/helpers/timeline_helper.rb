module TimelineHelper

  def timeline_widget(time_slots_path, filter = false)
    render 'shared/timeline', filter: filter
  end

end
