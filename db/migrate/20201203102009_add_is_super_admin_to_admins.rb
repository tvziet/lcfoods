class AddIsSuperAdminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :is_super_admin, :boolean, default: false
  end
end
