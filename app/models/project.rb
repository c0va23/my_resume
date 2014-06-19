class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :screenshots, dependent: :destroy
  has_many :tool_projects, dependent: :destroy
  has_many :tools, through: :tool_projects
end
