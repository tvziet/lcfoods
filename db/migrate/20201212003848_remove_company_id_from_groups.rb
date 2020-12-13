class RemoveCompanyIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :company_id
  end
end
