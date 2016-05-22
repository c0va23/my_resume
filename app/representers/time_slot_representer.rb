module TimeSlotRepresenter
  include Roar::JSON
  include ActionView::Helpers::TagHelper

  property :started_at_aligned, as: :start
  property :ended_at_aligned, as: :end
  property :content
  property :tool_names

  protected

  def content
    content_tag :a, project_name, href: project_path(project_id), title: project_name
  end

  def tool_names
    tools.map(&:name)
  end

  def started_at_aligned
    started_at.beginning_of_day
  end

  def ended_at_aligned
    ended_at_or_now.end_of_day
  end
end
