
class Admin::TimeSlotsController < Admin::BaseController

  respond_to :html

  before_action :find_project
  before_action :find_time_slot, only: %w[ show edit update delete destroy ]

  def index
    @time_slots = @project.time_slots
    respond_with @time_slots
  end

  def new
    @time_slot = @project.time_slots.build
    respond_with @time_slot
  end

  def create
    @time_slot = @project.time_slots.create(time_slot_params)
    respond_with @time_slot, location: [ :admin, @project, @time_slot ]
  end

  def show
    respond_with @time_slot
  end

  def update
    @time_slot.update_attributes(time_slot_params)
    respond_with @time_slot, location: [ :admin, @project, @time_slot ]
  end

  def delete
    respond_with @time_slot
  end

  def destroy
    @time_slot.destroy
    respond_with @time_slot, location: [ :admin, @project, :time_slots ]
  end

protected

  def find_project
    @project = Project.find(params[:project_id].to_i)
  end

  def time_slot_params
    params.require(:time_slot).permit(:started_at, :ended_at)
  end

  def find_time_slot
    @time_slot = @project.time_slots.find(params[:id].to_i)
  end

end
