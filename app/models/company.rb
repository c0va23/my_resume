class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :started_at, presence: true
end
