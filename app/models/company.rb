class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :started_at, presence: true, date: { before: proc { Time.current } }
  validates :ended_at, date: { after: :started_at }
  validates :site_url, url: { scheme: %w(http https) }
end
