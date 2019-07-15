class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.datetime :start_date
      t.string :skills
      t.float :payment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
