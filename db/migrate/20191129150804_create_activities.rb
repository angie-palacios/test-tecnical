class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.date :event_date,              null: false
      t.string :name,            null: false
      t.string :descrption,      null: false
      t.string :place,           null: false
      t.references :populations, foreign_key: true

      t.timestamps
    end
  end
end
