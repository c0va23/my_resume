# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include LocaleDetection
  include TimeZoneDetection

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render 'errors/not_found', status: :not_found
  end
end
