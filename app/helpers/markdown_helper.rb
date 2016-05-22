module MarkdownHelper
  MARKDOWN_OPTIONS = { autolink: true }.freeze

  def markdown(content)
    redcarpet_renderer.render(content).html_safe
  end

  protected

  def redcarpet_renderer
    Thread.current[:redcarpet_renderer] ||= begin
      Redcarpet::Markdown.new(Redcarpet::Render::HTML, MARKDOWN_OPTIONS)
    end
  end
end
