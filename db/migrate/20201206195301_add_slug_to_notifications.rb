class AddSlugToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :slug, :string
    add_index :notifications, :slug, unique: true
  end
end
