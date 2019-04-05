# frozen_string_literal: true

PUMA_THREADS_MIN = Integer(ENV['PUMA_THREADS_MIN'] || 0)
PUMA_THREADS_MAX = Integer(ENV['PUMA_THREADS_MAX'] || 1)
PUMA_WORKERS = Integer(ENV['PUMA_WORKERS'] || 1)

threads PUMA_THREADS_MIN, PUMA_THREADS_MAX
workers PUMA_WORKERS if PUMA_WORKERS > 1

environment ENV.fetch('RAILS_ENV', 'development')

preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env]
    config['pool'] = PUMA_THREADS_MAX
    ActiveRecord::Base.establish_connection(config)
  end
end
