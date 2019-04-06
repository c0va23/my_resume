# frozen_string_literal: true

module Admin
  class CompaniesController < Admin::BaseController
    respond_to :html

    def index
      @companies = Company.all
      respond_with @companies
    end

    def new
      @company = Company.new
      respond_with @company
    end

    def create
      @company = Company.create(company_params)
      respond_with @company, location: [:admin, @company]
    end

    def show
      @company = Company.find(params[:id])
      respond_with @company
    end

    def edit
      @company = Company.find(params[:id])
      respond_with @company
    end

    def update
      @company = Company.find(params[:id])
      @company.update(company_params)
      respond_with @company, location: [:admin, @company]
    end

    def delete
      @company = Company.find(params[:id])
      respond_with @company
    end

    def destroy
      @company = Company.find(params[:id])
      @company.destroy
      respond_with @company
    end

    private

    def company_params
      params.require(:company).permit(:name, :description, :site_url, :started_at, :ended_at)
    end
  end
end
