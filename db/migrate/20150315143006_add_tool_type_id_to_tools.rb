# frozen_string_literal: true

class AddToolTypeIdToTools < ActiveRecord::Migration[4.2]
  def change
    add_belongs_to :tools, :tool_type, index: true
  end
end
