class NullFalseRoleUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role_id, :bigint, :null => false
  end
  def down
    change_column :users, :role_id, :bigint, :null => true
  end
end
