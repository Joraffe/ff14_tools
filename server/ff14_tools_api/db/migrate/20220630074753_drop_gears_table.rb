class DropGearsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :gears
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
