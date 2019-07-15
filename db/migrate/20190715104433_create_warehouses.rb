class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.float :volume
      t.float :volume_left
      t.string :items
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
