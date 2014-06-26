class ToolsController < ApplicationController

  respond_to :html

  def index
    @tools = Tool.all
    respond_with @tools
  end

  def show
    @tool = Tool.find(params[:id].to_i)
    respond_with @tool
  end

end
