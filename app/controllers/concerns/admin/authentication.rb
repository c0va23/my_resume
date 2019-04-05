# frozen_string_literal: true

module Admin
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate
    end

    protected

    def authenticate
      admin_credentials = Rails.configuration.x.admin_credentials
      authenticate_or_request_with_http_basic 'MyResume' do |username, password|
        admin_credentials[:username] == username && admin_credentials[:password] == password
      end
    end
  end
end
