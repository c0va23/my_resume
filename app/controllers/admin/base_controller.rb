module Admin
  class BaseController < ApplicationController
    include Admin::Authentication
    include Admin::NavigationHelpers

    layout 'admin'
  end
end
