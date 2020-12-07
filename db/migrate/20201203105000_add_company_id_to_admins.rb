class AddCompanyIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :company_id, :integer
  end
end
