class CreateBossLoots < ActiveRecord::Migration[7.0]
  def change
    create_table :boss_loots do |t|
      t.references :boss, null: false, foreign_key: true
      t.references :loot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
