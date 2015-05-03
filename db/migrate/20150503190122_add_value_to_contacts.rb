class AddValueToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :value, :string
  end
end
