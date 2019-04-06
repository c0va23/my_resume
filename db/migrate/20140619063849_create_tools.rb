# frozen_string_literal: true

class CreateTools < ActiveRecord::Migration[4.2]
  def change
    create_table :tools do |t|
      t.string :name

      t.timestamps
    end
  end
end
