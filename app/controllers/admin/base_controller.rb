class Admin::BaseController < ApplicationController
  include Admin::Authentication

  layout 'admin'

end
