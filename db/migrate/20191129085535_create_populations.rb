class CreatePopulations < ActiveRecord::Migration[5.1]
  def change
    create_table :populations do |t|
      t.string :type_population
      t.integer :age_init
      t.integer :age_end

      t.timestamps
    end
  end
end
