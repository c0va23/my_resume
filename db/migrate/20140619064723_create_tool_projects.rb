# frozen_string_literal: true

class CreateToolProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :tool_projects do |t|
      t.references :project
      t.references :tool
      t.string :version

      t.timestamps
    end
  end
end
