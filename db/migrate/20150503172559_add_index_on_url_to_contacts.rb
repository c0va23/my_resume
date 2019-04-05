# frozen_string_literal: true

class AddIndexOnUrlToContacts < ActiveRecord::Migration[4.2]
  def change
    add_index :contacts, :url, unique: true
  end
end
