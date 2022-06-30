class CreateBosses < ActiveRecord::Migration[7.0]
  def change
    create_table :bosses do |t|
      t.string :name, null: false
      t.references :raid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
