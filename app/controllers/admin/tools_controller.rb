class Admin::ToolsController < Admin::BaseController
  respond_to :html

  before_action :find_tool, only: %w[ show edit update delete destroy ]

  def new
    @tool = Tool.new
    respond_with @tool
  end

  def index
    @tools = Tool.order(:name).all
    respond_with @tools
  end

  def create
    @tool = Tool.create(tool_params)
    respond_with @tool, location: [ :admin, @tool ]
  end

  def show
    respond_with @tool
  end

  def edit
    respond_with @tool
  end

  def update
    @tool.update_attributes(tool_params)
    respond_with @tool, location: [ :admin, @tool ]
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
    params.require(:tool).permit(:name)
  end

  def find_tool
    @tool = Tool.find(params[:id])
  end

end
