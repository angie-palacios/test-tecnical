class AddRolToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :rol, :string
    add_reference :users, :rol, index: true, foreign_key: true
  end
end
