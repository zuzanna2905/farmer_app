class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :number
      t.float :area
      t.datetime :year
      t.boolean :ownership
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
