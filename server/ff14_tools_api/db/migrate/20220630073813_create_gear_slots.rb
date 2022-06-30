class CreateGearSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :gear_slots do |t|
      t.references :gear_set, null: false, foreign_key: true
      t.string :slot

      t.timestamps
    end
  end
end
