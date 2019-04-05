# frozen_string_literal: true

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include Shoulda::Matchers::Independent, type: :model
end
