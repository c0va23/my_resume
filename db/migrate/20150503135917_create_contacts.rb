class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :label, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
