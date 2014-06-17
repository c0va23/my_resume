class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :screenshots, dependent: :destroy
end
