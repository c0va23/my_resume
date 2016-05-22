class ToolType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :tools, dependent: :nullify
end
