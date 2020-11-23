class RenameImagesToImageFromCarousels < ActiveRecord::Migration[5.2]
  def change
    rename_column :carousels, :images, :image
  end
end
