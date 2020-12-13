class RemoveCompanyIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :company_id
  end
end
