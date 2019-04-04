class TimeSlotRepresenter < Representable::Decorator
  include Representable::JSON

  project_link = lambda do |represented:, **|
    Rails.application.routes.url_helpers.project_path(represented.project_id)
  end

  started_at_aligned = -> (represented:, **) { represented.started_at.beginning_of_day }
  ended_at_aligned = -> (represented:, **) { represented.ended_at_or_now.end_of_day }

  tool_names = -> (represented:, **) { represented.tools.map(&:name) }

  property :project_name
  property :project_link,
           getter: project_link
  property :company_name
  property :started_at,
           getter: started_at_aligned
  property :ended_at,
           getter: ended_at_aligned
  property :tool_names,
           getter: tool_names
end
