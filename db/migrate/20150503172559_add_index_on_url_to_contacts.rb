class AddIndexOnUrlToContacts < ActiveRecord::Migration
  def change
    add_index :contacts, :url, unique: true
  end
end
