class CompaniesController < ApplicationController
  include Roar::Rails::ControllerAdditions

  represents :json, collection: CompanyCollectionRepresenter

  def index
    @companies = Company.all
    respond_with @companies
  end
end
