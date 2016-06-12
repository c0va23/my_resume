module TimeSlotRepresenter
  include Roar::JSON
  include ActionView::Helpers::TagHelper

  property :project_name
  property :project_link
  property :company_name
  property :started_at_aligned, as: :started_at
  property :ended_at_aligned, as: :ended_at
  property :tool_names

  protected

  def project_link
    project_path(project_id)
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
