module TimeStepRepresenter
  include Roar::Representer::JSON
  include ActionView::Helpers::TagHelper

  property :started_at, as: :start
  property :ended_at, as: :end
  property :content
  property :tool_names

protected

  def content
    content_tag :a, project_name, href: project_path(project_id), title: project_name
  end

  def tool_names
    self.tools.map(&:name)
  end

end
