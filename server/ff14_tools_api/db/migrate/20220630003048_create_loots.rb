class CreateLoots < ActiveRecord::Migration[7.0]
  def change
    create_table :loots do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
