class ProjectsController < ApplicationController
  respond_to :html, :json

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def index
    @projects = Project.all
    respond_with @projects
  end

  def timeline
    @time_slots = TimeSlot.order(:started_at)
    respond_with @time_slots
  end

end