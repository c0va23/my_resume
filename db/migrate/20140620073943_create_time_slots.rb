# frozen_string_literal: true

class CreateTimeSlots < ActiveRecord::Migration[4.2]
  def change
    create_table :time_slots do |t|
      t.date :started_at
      t.date :ended_at
      t.references :project, index: true

      t.timestamps
    end
  end
end
