class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :started_at, presence: true, date: { before: proc { Time.current } }
  validates :ended_at, date: { after: :started_at, allow_nil: true }
  validates :site_url, url: { scheme: %w[http https] }
end
