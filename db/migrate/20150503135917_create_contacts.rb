class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :label, null: false, uniq: true
      t.string :url, null: false, uniq: true

      t.timestamps null: false
    end
  end
end
