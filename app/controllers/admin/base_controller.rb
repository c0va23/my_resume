class Admin::BaseController < ApplicationController
  include Admin::Authentication
  include Admin::NavigationHelpers

  layout 'admin'

end
