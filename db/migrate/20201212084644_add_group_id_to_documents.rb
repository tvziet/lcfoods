class AddGroupIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :group_id, :integer
  end
end
