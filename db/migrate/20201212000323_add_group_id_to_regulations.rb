class AddGroupIdToRegulations < ActiveRecord::Migration[5.2]
  def change
    add_column :regulations, :group_id, :integer
  end
end
