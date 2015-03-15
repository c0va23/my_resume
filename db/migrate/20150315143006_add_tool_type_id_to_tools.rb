class AddToolTypeIdToTools < ActiveRecord::Migration
  def change
    add_belongs_to :tools, :tool_type, index: true
  end
end
