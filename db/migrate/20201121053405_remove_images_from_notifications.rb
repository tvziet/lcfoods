class RemoveImagesFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :images
  end
end
