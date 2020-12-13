class AddGroupIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :group_id, :integer
  end
end
