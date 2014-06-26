class ToolsController < ApplicationController

  respond_to :html

  def index
    @tools = Tool.all
    respond_with @tools
  end

end
