# frozen_string_literal: true

class AddValueToContacts < ActiveRecord::Migration[4.2]
  def change
    add_column :contacts, :value, :string
  end
end
