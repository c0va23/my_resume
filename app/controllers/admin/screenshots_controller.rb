class Admin::ScreenshotsController < Admin::BaseController
  respond_to :html

  before_action :find_project
  before_action :find_screenshot, only: %w[ show edit update delete destroy ]

  def index
    @screenshots = @project.screenshots
    respond_with @screenshots
  end

  def show
    respond_with @screenshot
  end

  def new
    @screenshot = @project.screenshots.build
    respond_with @screenshot
  end

  def create
    @screenshot = @project.screenshots.create(screenshot_params)
    respond_with @screenshot, location: admin_project_screenshots_path(@project)
  end

  def delete
    respond_with @screenshot
  end

  def destroy
    @screenshot.destroy
    respond_with @screenshot, location: admin_project_screenshots_path(@project)
  end

  def edit
    respond_with @screenshot
  end

  def update
    @screenshot.update_attributes(screenshot_params)
    respond_with @screenshot, location: admin_project_screenshot_path(@project, @screenshot)
  end

private

  def find_project
    @project = Project.find(params[:project_id].try(:to_i))
  end

  def find_screenshot
    @screenshot = @project.screenshots.find(params[:id].try(:to_i))
  end

  def screenshot_params
    params.require(:screenshot).permit(:name, :description, :image)
  end

end
