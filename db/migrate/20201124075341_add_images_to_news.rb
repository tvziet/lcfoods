class AddImagesToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :images, :string
  end
end
