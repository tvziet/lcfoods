class AddIsSuperAdminToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :is_super_admin, :boolean, default: false
  end
end
