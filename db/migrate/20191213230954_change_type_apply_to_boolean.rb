class ChangeTypeApplyToBoolean < ActiveRecord::Migration[5.1]
  def change
    change_column :permissions, :apply, "BOOLEAN USING apply::BOOLEAN"
  end
end
