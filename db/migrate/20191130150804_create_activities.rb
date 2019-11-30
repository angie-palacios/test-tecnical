class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.date :date,              null: false, default: ""
      t.string :name,            null: false, default: ""
      t.string :descrption,      null: false, default: ""
      t.string :place,           null: false, default: ""
      t.string :type_population, null: false, default: ""

      t.timestamps
    end
  end
end
