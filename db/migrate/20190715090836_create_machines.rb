class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.datetime :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
