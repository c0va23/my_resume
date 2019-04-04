class CompaniesController < ApplicationController
  respond_to :json

  def index
    @companies = Company.all
    respond_with CompanyCollectionRepresenter.new(@companies)
  end
end
