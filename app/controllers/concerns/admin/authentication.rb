module Admin
  module Authentication
    extend ActiveSupport::Concern

    USERNAME = ENV['ADMIN_USERNAME'] || 'admin'
    PASSWORD = ENV['ADMIN_PASSWORD']

    included do
      before_action :authenticate
    end

    protected

    def authenticate
      authenticate_or_request_with_http_basic 'MyResume' do |username, password|
        USERNAME == username && PASSWORD == password
      end
    end
  end
end
