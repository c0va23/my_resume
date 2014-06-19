class ToolProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :tool
end
