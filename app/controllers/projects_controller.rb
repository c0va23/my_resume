# frozen_string_literal: true

class ProjectsController < ApplicationController
  respond_to :html, :json

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def index
    @projects = Project.order(:name).all
    respond_with @projects
  end
end
