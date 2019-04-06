# frozen_string_literal: true

module Admin
  class ToolsController < Admin::BaseController
    respond_to :html

    before_action :find_tool, only: %i[show edit update delete destroy]

    def new
      @tool = Tool.new
      respond_with @tool
    end

    def index
      @tools = Tool.order(:name).preload(:tool_type).all
      respond_with @tools
    end

    def create
      @tool = Tool.create(tool_params)
      respond_with @tool, location: [:admin, @tool]
    end

    def show
      respond_with @tool
    end

    def edit
      respond_with @tool
    end

    def update
      @tool.update(tool_params)
      respond_with @tool, location: [:admin, @tool]
    end

    def delete
      respond_with @tool
    end

    def destroy
      @tool.destroy
      respond_with @tool, location: :admin_tools
    end

    protected

    def tool_params
      params.require(:tool).permit(:name, :tool_type_id)
    end

    def find_tool
      @tool = Tool.find(params[:id])
    end
  end
end
