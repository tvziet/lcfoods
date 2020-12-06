class AddSlugToRegulations < ActiveRecord::Migration[5.2]
  def change
    add_column :regulations, :slug, :string
    add_index :regulations, :slug, unique: true
  end
end
