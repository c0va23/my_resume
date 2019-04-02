class AddCompanyIdToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :company, index: true, foreign_key: true
  end
end
