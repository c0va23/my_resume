# frozen_string_literal: true

class AddProjectIdToScreenshots < ActiveRecord::Migration[4.2]
  def change
    add_column :screenshots, :project_id, :integer
  end
end
