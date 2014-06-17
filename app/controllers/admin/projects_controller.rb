class Admin::ProjectsController < Admin::BaseController
  before_action :find_project, only: %w[ show edit update delete destroy ]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to [ :admin, @project ]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to [ :admin, @project ]
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path
  end

private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :url)
  end

end