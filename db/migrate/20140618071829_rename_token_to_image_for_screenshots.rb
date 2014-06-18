class RenameTokenToImageForScreenshots < ActiveRecord::Migration
  def change
    rename_column :screenshots, :token, :image
  end
end
