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

private

  def find_project
    @project = Project.find(project_id)
  end

  def project_id
    params.require(:project_id => Integer)
  end

  def find_screenshot
    @screenshot = @project.screenshots.find(screenshot_id)
  end

  def screenshot_id
    params.require(:screenshot_id => Integer)
  end

end
