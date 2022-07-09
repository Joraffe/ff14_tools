class AddPermissionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :permission, null: false, foreign_key: true
  end
end
