class RemoveImagesFromNews < ActiveRecord::Migration[5.2]
  def change
    remove_column :news, :images
  end
end
