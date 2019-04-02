class RenameTokenToImageForScreenshots < ActiveRecord::Migration[4.2]
  def change
    rename_column :screenshots, :token, :image
  end
end
