class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.string :cell_phone
      t.string :address
      t.text :bio
      t.string :fax
      t.string :avatar

      t.timestamps
    end
  end
end
