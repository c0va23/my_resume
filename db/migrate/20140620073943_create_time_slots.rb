class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :project, index: true

      t.timestamps
    end
  end
end
