class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.references :chemical, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :machine, foreign_key: true
      t.references :field, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
