class AddNameToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :name, :string
  end
end
