class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.date :started_at
      t.date :ended_at
      t.references :project, index: true

      t.timestamps
    end
  end
end
