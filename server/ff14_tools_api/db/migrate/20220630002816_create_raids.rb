class CreateRaids < ActiveRecord::Migration[7.0]
  def change
    create_table :raids do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
