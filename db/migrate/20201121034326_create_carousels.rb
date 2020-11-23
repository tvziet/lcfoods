class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :images
      t.integer :status

      t.timestamps
    end
  end
end
