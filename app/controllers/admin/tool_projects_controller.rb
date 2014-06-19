class Admin::ToolProjectsController < Admin::BaseController

  respond_to :html

  before_action :find_project
  before_action :find_tool_project, only: %w[ show edit update delete destroy ]

  def index
    @tool_projects = @project.tool_projects
    respond_with @tool_projects
  end

  def new
    @tool_project = @project.tool_projects.build
    respond_with @tool_project
  end

  def create
    @tool_project = @project.tool_projects.create(tool_project_params)
    respond_with @tool_project, location: [ :admin, @project, @tool_project ]
  end

  def show
    respond_with @tool_project
  end

  def edit
    respond_with @tool_project
  end

  def update
    @tool_project.update_attributes(tool_project_params)
    respond_with @tool_project, location: [ :admin, @project, @tool_project ]
  end

  def delete
    respond_with @tool_project
  end

  def destroy
    @tool_project.destroy
    respond_with @tool_project, location: [ :admin, @project, :tool_projects ]
  end

protected

  def find_project
    @project = Project.find(params[:project_id].to_i)
  end

  def tool_project_params
    params.require(:tool_project).permit(:tool_id, :version)
  end

  def find_tool_project
    @tool_project = @project.tool_projects.find(params[:id])
  end

end
