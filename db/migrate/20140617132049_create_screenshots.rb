class CreateScreenshots < ActiveRecord::Migration[4.2]
  def change
    create_table :screenshots do |t|
      t.string :name
      t.text :description
      t.string :token

      t.timestamps
    end
  end
end
