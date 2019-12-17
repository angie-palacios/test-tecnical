class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :code
      t.string :name
      t.string :description
      t.references :rols, foreign_key: true
      t.string :apply

      t.timestamps
    end
  end
end
