class CreateContacts < ActiveRecord::Migration[4.2]
  def change
    create_table :contacts do |t|
      t.string :label, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
