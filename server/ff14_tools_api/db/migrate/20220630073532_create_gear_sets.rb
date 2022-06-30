class CreateGearSets < ActiveRecord::Migration[7.0]
  def change
    create_table :gear_sets do |t|
      t.references :character, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
