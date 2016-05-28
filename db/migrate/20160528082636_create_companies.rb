class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :description
      t.string :site_url
      t.datetime :started_at, null: false
      t.datetime :ended_at

      t.timestamps null: false
    end
    add_index :companies, :name, unique: true
  end
end
