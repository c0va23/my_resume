# frozen_string_literal: true

module Admin
  class ToolTypesController < Admin::BaseController
    respond_to :html

    before_action :find_tool_type, only: %i[show edit update delete destroy]

    def index
      @tool_types = ToolType.all
      respond_with @tool_types
    end

    def show
      respond_with @tool_type
    end

    def new
      @tool_type = ToolType.new
      respond_with @tool_type
    end

    def create
      @tool_type = ToolType.create(tool_type_params)
      respond_with @tool_type, location: [:admin, @tool_type]
    end

    def edit
      respond_with @tool_type
    end

    def update
      @tool_type.update(tool_type_params)
      respond_with @tool_type, location: [:admin, @tool_type]
    end

    def delete
      respond_with @tool_type
    end

    def destroy
      @tool_type.destroy
      respond_with @tool_type, location: :admin_tool_types
    end

    protected

    def find_tool_type
      @tool_type = ToolType.find(params[:id])
    end

    def tool_type_params
      params.require(:tool_type).permit(:name)
    end
  end
end
