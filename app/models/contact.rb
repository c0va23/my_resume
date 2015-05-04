class Contact < ActiveRecord::Base
  validates :label, presence: true
  validates :url, presence: true, uniqueness: true, url: { scheme: %w[ http https mailto skype ] }
end
