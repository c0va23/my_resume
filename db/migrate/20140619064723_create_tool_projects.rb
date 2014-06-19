class CreateToolProjects < ActiveRecord::Migration
  def change
    create_table :tool_projects do |t|
      t.references :project
      t.references :tool
      t.string :version

      t.timestamps
    end
  end
end
