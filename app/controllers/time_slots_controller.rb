class TimeSlotsController < ApplicationController
  respond_to :json

  def index
    @time_slots = base_scope.order(:started_at).includes(:tools, project: [:company])
    respond_with TimeSlotCollectionRepresenter.new(@time_slots)
  end

  protected

  def base_scope
    @base_scope ||= if params.key?(:tool_id)
                      Tool.find(params[:tool_id]).time_slots
                    elsif params.key?(:project_id)
                      Project.find(params[:project_id]).time_slots
                    else
                      TimeSlot.all
                    end
  end
end
