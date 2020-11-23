class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :body
      t.string :images
      t.string :attachments
      t.integer :status
      t.references :category, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
