class RemoveImagesFromRegulations < ActiveRecord::Migration[5.2]
  def change
    remove_column :regulations, :images
  end
end
