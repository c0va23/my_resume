# frozen_string_literal: true

module Admin
  class PagesController < Admin::BaseController
    respond_to :html

    before_action :find_page, only: %i[show edit update delete destroy]

    def index
      @pages = Page.all
      respond_with @pages
    end

    def new
      @page = Page.new
      respond_with @page
    end

    def show
      respond_with @page
    end

    def create
      @page = Page.create(page_params)
      respond_with @page, location: [:admin, @page]
    end

    def edit
      respond_with @page
    end

    def update
      @page.update(page_params)
      respond_with @page, location: [:admin, @page]
    end

    def delete
      respond_with @page
    end

    def destroy
      @page.destroy
      respond_with @page, location: :admin_pages
    end

    protected

    def find_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :content)
    end
  end
end
