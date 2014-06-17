class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :name
      t.text :description
      t.string :token

      t.timestamps
    end
  end
end
