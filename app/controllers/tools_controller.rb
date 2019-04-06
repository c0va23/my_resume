# frozen_string_literal: true

class ToolsController < ApplicationController
  respond_to :html, only: %i[index show]
  respond_to :svg, only: %i[versions]

  before_action :find_tool, only: %i[show versions]

  def index
    @tools = Tool.includes(:time_slots).preload(:tool_type).order(:name).all
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
