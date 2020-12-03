class AddFullNameToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :full_name, :string
  end
end
