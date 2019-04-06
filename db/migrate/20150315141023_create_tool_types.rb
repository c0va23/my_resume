# frozen_string_literal: true

class CreateToolTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :tool_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
