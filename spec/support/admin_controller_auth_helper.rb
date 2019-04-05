# frozen_string_literal: true

module AdminControllerAuthHelper
  def admin_authenticated
    username, password = *Rails.configuration.x.admin_credentials.values_at(:username, :password)
    request.env['HTTP_AUTHORIZATION'] = encode_credentials(username, password)
  end

  private

  def encode_credentials(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials username, password
  end
end
