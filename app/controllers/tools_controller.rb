class ToolsController < ApplicationController

  respond_to :html, only: %w[ index show ]
  respond_to :svg, only: %w[ versions ]

  before_action :find_tool, only: %w[ show versions ]

  def index
    @tools = Tool.all
    respond_with @tools
  end

  def show
    respond_with @tool
  end

  def versions
    @versions = @tool.versions
    respond_with @versions
  end

protected

  def find_tool
    @tool = Tool.find(params[:id].to_i)
  end

end
