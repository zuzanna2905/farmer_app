class CreateChemicals < ActiveRecord::Migration[5.2]
  def change
    create_table :chemicals do |t|
      t.string :name
      t.datetime :expiration_date
      t.float :volume
      t.float :volume_left
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
