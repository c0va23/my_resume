class AddRoleToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :role, :text
  end
end
